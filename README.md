**Table of Contents**

- [ Overview](#-overview)
- [ Features](#-features)
- [ Repository Structure](#-repository-structure)
- [ Modules](#-modules)
- [ Getting Started](#-getting-started)
  - [ Installation](#-installation)
  - [ Usage](#-usage)
  - [ Tests](#-tests)
- [ Project Roadmap](#-project-roadmap)
- [ Contributing](#-contributing)
- [ License](#-license)
- [ Acknowledgments](#-acknowledgments)

##  Overview

Prophecy Analytics DAIS 2024 orchestrates a data analytics pipeline, leveraging Prophecy for streamlined workflow management. It structures data from LinkedIn, Google Ads, and Amazon sources into bronze, silver, and gold models for advanced analytics insights. By defining schemas, cleaning datasets, and generating reports, the project facilitates targeted marketing campaigns and empowers data-driven decision-making.

---

##  Features

|    |   Feature         | Description |
|----|-------------------|---------------------------------------------------------------|
| ⚙️  | **Architecture**  | The project follows a modular architecture for efficient data processing. It leverages Prophecy for analytics pipelines, separating data sources and models into distinct modules. |
| 🔩 | **Code Quality**  | The codebase maintains good quality and adheres to a consistent style throughout. Clear code structure and thoughtful variable naming enhance readability. |
| 📄 | **Documentation** | The project includes detailed YAML configuration files outlining project structures and data schemas. It lacks extensive documentation beyond configuration details. |
| 🔌 | **Integrations**  | Key integrations include SQL for database interactions and YAML for configuration files. The codebase relies on these dependencies for data processing. |
| 🧩 | **Modularity**    | The codebase demonstrates good modularity by organizing data sources, models, and transformations into separate modules. This promotes code reusability and easy maintenance. |
| 🧪 | **Testing**       | Testing frameworks and tools are not explicitly mentioned in the provided details. Additional information on testing practices would be beneficial for ensuring code reliability. |
| ⚡️  | **Performance**   | The project showcases efficient data processing with a focus on optimizing analytics workflows. The use of Prophecy and structured data models contributes to enhanced performance. |
| 🛡️ | **Security**      | Data protection measures and access controls are not explicitly discussed in the provided details. Further insights into security implementations would be valuable for ensuring data integrity. |
| 📦 | **Dependencies**  | Key external libraries and dependencies include SQL, YAML, and Prophecy for data analytics functionality. These dependencies play a crucial role in data processing tasks. |

---

##  Repository Structure

```sh
└── prophecy_analytics_dais_2024/
    ├── README.md
    ├── dbt_project.yml
    ├── macros
    │   └── README.md
    ├── models
    │   ├── README.md
    │   ├── bronze
    │   ├── gold
    │   └── silver
    ├── pbt_project.yml
    ├── prophecy-sources
    │   ├── sources.yml
    │   └── unreferencedSources.yml
    ├── seeds
    │   ├── README.md
    │   ├── amazon
    │   ├── google_ads
    │   └── linkedin
    ├── snapshots
    │   └── README.md
    └── tests
        └── README.md
```

---

##  Modules

<details closed><summary>.</summary>

| File                                                                                                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                                                      | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [pbt_project.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/pbt_project.yml) | This `pbt_project.yml` file in the `prophecy_analytics_dais_2024` repository serves as a configuration file defining the project structure and details for a Prophecy-based data analytics pipeline. It outlines the project name, version, author, language, functions, and dependencies. The file plays a critical role in orchestrating the data processing tasks and defining the necessary components for the analytics workflow within the repositorys architecture. |
| [dbt_project.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/dbt_project.yml) | Defines project structure, specifies file paths for cleaning, seeds, models, macros, and targets. Sets project details like name, version, and profile for the prophecy_analytics_dais_2024 repository in the dbt_project.yml.                                                                                                                                                                                                                                             |

</details>

<details closed><summary>prophecy-sources</summary>

| File                                                                                                                                      | Summary                                                                                                                                                                                                                                                |
| ---                                                                                                                                       | ---                                                                                                                                                                                                                                                    |
| [unreferencedSources.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/prophecy-sources/unreferencedSources.yml) | Identifies and lists unreferenced data sources within the prophecy-sources module. Empty unreferencedSources array in unreferencedSources.yml signals no unresolved dependencies for effective data modeling.                                          |
| [sources.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/prophecy-sources/sources.yml)                         | Defines data schemas for LinkedIn and Google sources within the analytics database. Specifies tables, columns, and data types essential for analytics data processing. Enables seamless data extraction and analysis for targeted marketing campaigns. |

</details>

<details closed><summary>models.bronze.amazon</summary>

| File                                                                                                                                                          | Summary                                                                                                                                                                                                                                     |
| ---                                                                                                                                                           | ---                                                                                                                                                                                                                                         |
| [br_am_campaign_history.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/amazon/br_am_campaign_history.sql)           | Transforms Amazon campaign history data into a formatted table for prophecy_analytics_dais_2024s bronze models. Selects latest records for each campaign, capturing details like budget, serving status, and more, aiding in data analysis. |
| [schema.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/amazon/schema.yml)                                           | Defines Amazon Ads campaign data schema with detailed columns for bronze models in the repository. Describes campaign, profile, and history entities for analytics processing.                                                              |
| [br_am_campaign_level_report.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/amazon/br_am_campaign_level_report.sql) | Extracts and structures Amazon campaign metrics data from the bronze model to enable analytics insights in the Amazon source within the repository's data transformation architecture.                                                      |
| [br_am_profile.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/amazon/br_am_profile.sql)                             | Refactors** dt_am_profile data, extracting fields and standardizing data types for Amazon's Bronze-level profiles in the analytics pipeline.                                                                                                |

</details>

<details closed><summary>models.bronze.google_ads</summary>

| File                                                                                                                                                  | Summary                                                                                                                                                                                                               |
| ---                                                                                                                                                   | ---                                                                                                                                                                                                                   |
| [schema.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/google_ads/schema.yml)                               | Defines Google Ads schema models for daily performance and ad history. Describes account stats, device usage, costs, and ad details. Facilitates structured data organization within the analytics platform.          |
| [br_go_account_stats.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/google_ads/br_go_account_stats.sql)     | Refactor model to cleanse Google Ads account stats data from source, organizing details like customer ID, date, ad network, device, clicks, spend, and impressions for better analytics insights in the bronze layer. |
| [br_go_ad_history.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/google_ads/br_go_ad_history.sql)           | Generates reformatted Google Ads campaign history data from the raw dataset for downstream analytics in the bronze model layer of the repository.                                                                     |
| [br_go_account_history.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/google_ads/br_go_account_history.sql) | Extracts most recent Google Ads account history data, organizing and cleaning for analytics use. Identifies latest record for each account.                                                                           |

</details>

<details closed><summary>models.bronze.linkedin</summary>

| File                                                                                                                                                                  | Summary                                                                                                                                                                                                                                                                                     |
| ---                                                                                                                                                                   | ---                                                                                                                                                                                                                                                                                         |
| [schema.yml](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/linkedin/schema.yml)                                                 | Defines LinkedIn campaign schemas, including details like account, budget, status, and targeting. Captures campaign history and daily ad performance for insightful analytics. Enhances data modeling within the bronze layer of the repositorys analytics infrastructure.                  |
| [br_li_account_history.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/linkedin/br_li_account_history.sql)                   | Derive LinkedIn account history data from the linkedin source for analysis, reconstructing account details like ID, name, currency, and timestamps to facilitate further insights within the parent repository's analytics architecture.                                                    |
| [br_li_campaign_history.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/linkedin/br_li_campaign_history.sql)                 | Defines structured LinkedIn campaign history data transformation, filtering latest versions. Categorizes key details and flags latest versions for analysis. Enhances analysis with relevant campaign, budget, and timestamp information for the parent repositorys analytics architecture. |
| [br_li_ad_analytics_by_campaign.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/bronze/linkedin/br_li_ad_analytics_by_campaign.sql) | Transforms LinkedIn ad analytics by campaign data for bronze modeling, extracting source, date, campaign ID, clicks, impressions, and cost.                                                                                                                                                 |

</details>

<details closed><summary>models.silver.amazon</summary>

| File                                                                                                                                            | Summary                                                                                                                                                                                                    |
| ---                                                                                                                                             | ---                                                                                                                                                                                                        |
| [sv_am_account_report.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/silver/amazon/sv_am_account_report.sql) | Analyzes Amazon advertising campaign data to generate a summary report. Joins campaign history, profile, and campaign level data. Aggregates total clicks, impressions, and cost by profile for reporting. |

</details>

<details closed><summary>models.silver.google_ads</summary>

| File                                                                                                                                                | Summary                                                                                                                                                                             |
| ---                                                                                                                                                 | ---                                                                                                                                                                                 |
| [sv_go_account_report.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/silver/google_ads/sv_go_account_report.sql) | Derive total metrics for Google Ads accounts. Integrate history and stats to calculate and limit top 100 account metrics based on clicks, impressions, spend, and other attributes. |

</details>

<details closed><summary>models.silver.linkedin</summary>

| File                                                                                                                                              | Summary                                                                                                                                                                                       |
| ---                                                                                                                                               | ---                                                                                                                                                                                           |
| [sv_li_account_report.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/silver/linkedin/sv_li_account_report.sql) | Generates comprehensive campaign performance insights by merging ad analytics, campaign history, and account data, providing a summarized view of clicks, impressions, and costs per account. |

</details>

<details closed><summary>models.gold.all</summary>

| File                                                                                                                                         | Summary                                                                                                                                                                                                      |
| ---                                                                                                                                          | ---                                                                                                                                                                                                          |
| [gl_all_account_report.sql](https://github.com/several27/prophecy_analytics_dais_2024/blob/master/models/gold/all/gl_all_account_report.sql) | Generates a unified account report by combining cleaned data from Amazon, Google Ads, and LinkedIn sources. Organizes account metrics for analytics purposes within the repositorys data modeling structure. |

</details>

---

##  Getting Started

**System Requirements:**

* **SQL**: `version x.y.z`

###  Installation

<h4>From <code>source</code></h4>

> 1. Clone the prophecy_analytics_dais_2024 repository:
>
> ```console
> $ git clone https://github.com/several27/prophecy_analytics_dais_2024
> ```
>
> 2. Change to the project directory:
> ```console
> $ cd prophecy_analytics_dais_2024
> ```
>
> 3. Install the dependencies:
> ```console
> $ > INSERT-INSTALL-COMMANDS
> ```

###  Usage

<h4>From <code>source</code></h4>

> Run prophecy_analytics_dais_2024 using the command below:
> ```console
> $ > INSERT-RUN-COMMANDS
> ```

###  Tests

> Run the test suite using the command below:
> ```console
> $ > INSERT-TEST-COMMANDS
> ```

---

##  Project Roadmap

- [X] `► INSERT-TASK-1`
- [ ] `► INSERT-TASK-2`
- [ ] `► ...`

---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Report Issues](https://github.com/several27/prophecy_analytics_dais_2024/issues)**: Submit bugs found or log feature requests for the `prophecy_analytics_dais_2024` project.
- **[Submit Pull Requests](https://github.com/several27/prophecy_analytics_dais_2024/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/several27/prophecy_analytics_dais_2024/discussions)**: Share your insights, provide feedback, or ask questions.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/several27/prophecy_analytics_dais_2024
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="center">
   <a href="https://github.com{/several27/prophecy_analytics_dais_2024/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=several27/prophecy_analytics_dais_2024">
   </a>
</p>
</details>

---

##  License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#-overview)

---
