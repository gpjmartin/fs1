#Setting up BIAC (Built-in Access Control)

Changes to config.properties:

    starburst.access-control.enabled=true
    starburst.access-control.authorized-users=starburst_service
    starburst.access-control.authorized-groups=wizards,knights
    starburst.access-control.audit.enabled=true
 
Comment out the below if it is set:
    \#insights.authorized-users=starburst_service

