## SkillRank
A `SkillRank` represents a rank of a [Skill](https://github.com/LartTyler/MHWDB-Docs/blob/master/Objects/Skill.md). It includes any stat modifiers that the skill conveys at that rank, as well as a text description of the skill at that rank.

## Fields
|Field Name|Type|Description|
|:---|:---|:---|
|id|integer|The ID of the skill rank|
|slug|string|A unique string identifier|
|level|unsigned integer|The numeric level of the skill, starting at 1|
|description|string|A text description of the skill rank's effects|
|modifiers|object|A object containing any stats that the skill rank modifies|
