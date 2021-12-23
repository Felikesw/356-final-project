DROP TABLE IF EXISTS `Risk Factors`;

CREATE TABLE `Risk Factors`(
    risk_factor_id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , severe VARCHAR(24)
    , severe_lower_bound VARCHAR(24)
    , severe_upper_bound VARCHAR(24)
    , severe_p_value VARCHAR(24)
    , severe_significant VARCHAR(64)
    , severe_adjusted VARCHAR(64)
    , severe_calculated VARCHAR(64)
    , fatality VARCHAR(24)
    , fatality_lower_bound VARCHAR(24)
    , fatality_upper_bound VARCHAR(24)
    , fatality_p_value VARCHAR(24)
    , fatality_significant VARCHAR(64)
    , fatality_adjusted VARCHAR(64)
    , fatality_calculated VARCHAR(64)
    , multivariate_adjustment LONGTEXT
    , sample_size VARCHAR(255)
    , study_population LONGTEXT
    , added_on VARCHAR(64)
    , critical_only VARCHAR(2)
    , discharged_or_death VARCHAR(24)
    , PRIMARY KEY (risk_factor_id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO `Risk Factors`(
    study_id
    , title 
    , severe 
    , severe_lower_bound 
    , severe_upper_bound  
    , severe_p_value 
    , severe_significant
    , severe_adjusted 
    , severe_calculated

    , fatality 
    , fatality_lower_bound 
    , fatality_upper_bound 
    , fatality_p_value 
    , fatality_significant 
    , fatality_adjusted 
    , fatality_calculated 

    , multivariate_adjustment 
    , sample_size 
    , study_population 
    , added_on 
    , critical_only
    , discharged_or_death
) SELECT
    study_id,
    Study,

    Severe,
    `Severe lower bound`,
    `Severe upper bound`,
    `Severe p-value`,
    `Severe significant`, 
    `Severe adjusted`, 
    `Severe Calculated`, 

    Fatality,
    `Fatality lower bound`,
    `Fatality upper bound`,
    `Fatality p-value`,
    `Fatality significant`, 
    `Fatality adjusted`, 
    `Fatality Calculated`, 
    
    `Multivariate Adjustment`,
    `Sample Size`,
    `Study Population`,
    `Added on`,
    `Critical only`,
    `Discharged_or_death`
FROM temp_risk_f
INNER JOIN Study ON title=Study;