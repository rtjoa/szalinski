# Assumes only one line contains start and only one line contains end
def split3(filename, start, end):
    through_start, mid, from_end = [], [], []
    with open(filename, "r") as file:
        seen_start = False
        lines = file.readlines()
        for i, line in enumerate(lines):
            if not seen_start:
                through_start.append(line)
            if start in line:
                seen_start = True
            elif end in line:
                from_end.extend(lines[i:])
                break
            elif seen_start:
                mid.append(line)
    return through_start, mid, from_end

def get_rules(filename, start="RULER RULES START", end="RULER RULES END"):
    return split3(filename, start, end)[1]

def set_rules(filename, lines_to_insert, start="RULER RULES START", end="RULER RULES END"):
    through_start, _, from_end = split3(filename, start, end)

    with open(filename, "w") as file:
        file.writelines(through_start + lines_to_insert + from_end)

rule_lines = get_rules("out/rules.txt")
rule_lines = ["rules.extend(vec![\n", *rule_lines, "]);\n"]
set_rules("src/rules.rs", rule_lines)
