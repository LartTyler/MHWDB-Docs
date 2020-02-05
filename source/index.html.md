---
title: Monster Hunter World API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - javascript

toc_footers:
  - <a href="https://github.com/LartTyler/MHWDB-API">View the Project On GitHub</a>
  - <a href="https://github.com/LartTyler/MHWDB-Docs/issues">Report a Bug / Request a Feature</a>
  - <a href="https://discord.gg/6GEHHQh">Join Us On Discord</a>
  - <a href="https://contrib.mhw-db.com">Browse the API</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - endpoints_ailments
  - endpoints_armor
  - endpoints_armor_sets
  - endpoints_charms
  - endpoints_decorations
  - endpoints_events
  - endpoints_items
  - endpoints_locations
  - endpoints_monsters
  - endpoints_motion_values
  - endpoints_skills
  - endpoints_weapons
  - data_types
  - searching
  - projecting
  - deprecations
  - errors

search: true
---

# Introduction
Welcome to the API docs for [https://mhw-db.com](https://mhw-db.com).

We are currently looking for help with data entry and validation. We also always welcome feedback and suggestions.
Interesting in contributing to the project? [Join us on Discord!](https://discord.gg/6GEHHQh)

## Accessing the API
All data in the API can be accessed using the base URL `https://mhw-db.com`. You may optionally include a language tag
as the prefix to any route in the API, in order to retrieve results that have been translated to a specific language.
For a list of supported language tags, see the section on [Localization](#localization) below.

Example code and URLs in the rest of this documentation will not include any language tag prefixes for the sake of
readability.

## Localization
Currently, the API supports the following languages.

|Language|Tag|
|---|---|
|English|&mdash;|
|French|`fr`|
|German|`de`|
|Chinese (simplified)|`zh`|
|Chinese (traditional)|`zh-Hant`|

The default language is English, and does not require a language tag prefix on any route. To switch to any other
language, simply prefix the route with the tag, e.g. `https://mhw-db.com/zh-Hant/weapons/1`.

**Please be aware** that not all supported languages will contain localized data, and may return `null` values for
string fields. Localization requires manual data entry, and we're working through getting localized names into the API
as quickly as possible. If you would like to help with localization, please reach out to me at
[tyler@lartonoix.com](mailto:tyler@lartonoix.com), or contact us via the [Discord server](https://discord.gg/6GEHHQh)
linked in the sidebar.