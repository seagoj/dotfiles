if ! which CrashPlanDesktop; then
    osinstall crashplan
    systemctl enable crashplan.service
    systemctl start crashplan.service
fi
