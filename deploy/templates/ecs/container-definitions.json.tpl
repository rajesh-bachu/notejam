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
      "environment": [
        {
          "name": "DB_HOST",
          "value": "notejam-staging-dbinstance.cdj2prkh8lcj.eu-central-1.rds.amazonaws.com"
        },
        {
          "name": "DB_NAME",
          "value": "mydb"
        },
        {
          "name": "DB_PASS",
          "value": "foobarbaz"
        },
        {
          "name": "DB_USER",
          "value": "foo"
        }
      ],
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