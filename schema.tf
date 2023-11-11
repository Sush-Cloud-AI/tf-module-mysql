# # Injecting the schema into sql database
# resource "null_resource" "sqlschema" {
#     depends_on = [aws_db_instance.mysql]

# provisioner "local-exec" {
#     command = <<EOF
#         cd /tmp
#         curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
#         unzip -o /tmp/mysql.zip
#         cd mysql-main
#         mysql -h ${aws_db_instance.mysql.address} -uadmin1 -proboshop1 < shipping.sql
#     EOF
 

# }

# }

# # # # Injecting the schema
    resource "null_resource" "schema" {

    depends_on = [aws_db_instance.mysql]  
    provisioner "local-exec" {
            command = "cd /home/centos"
        }
    provisioner "local-exec" {
            command = 'curl -s -L -o /home/centos/main.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"'
        }

    # provisioner "local-exec" {
    #         command = "unzip -o /tmp/main.zip"
    #     }        
    # provisioner "local-exec" {
    #         command = "cd /tmp/mysql-main"
    #     }

    # provisioner "local-exec" {
    #         command = "mysql -h ${aws_db_instance.mysql.address} -uadmin1 -proboShop1 < shipping.sql"
    #     }
    }


