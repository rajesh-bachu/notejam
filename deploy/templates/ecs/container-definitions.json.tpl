[
    {
        "name": "api",
        "image": "${app_image}",
        "essential": true,
        "memoryReservation": 256,
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "${log_group_name}",
                "awslogs-region": "${log_group_region}",
                "awslogs-stream-prefix": "api"
            }
        },
        "environment":[{
            "DB_HOST": "notejam-staging-dbinstance.cdj2prkh8lcj.eu-central-1.rds.amazonaws.com",
            "DB_NAME": "mydb",
            "DB_PASS": "foobarbaz",
            "DB_USER": "foo"
        }],
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 80
            }
        ],
        "mountPoints": [
            {
                "readOnly": false,
                "containerPath": "/vol/web",
                "sourceVolume": "static"
            }
        ]
    }
]
