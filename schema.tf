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

# # # # Injecting the schema into mysql
resource "null_resource" "schema" {

depends_on = [aws_db_instance.mysql]  
provisioner "local-exec" {
        command =  "curl -s -L -o mysql.zip 'https://github.com/stans-robot-project/mysql/archive/main.zip'"
            
        }

provisioner "local-exec" {
        command = "unzip -o /var/lib/jenkins/workspace/terraform-databases/mysql.zip"
            
        }
# provisioner "local-exec" {
#         command = "cd /var/lib/jenkins/workspace/terraform-databases/mysql-main/"
            
#         }
provisioner "local-exec" {
        command = "mv /var/lib/jenkins/workspace/terraform-databases/mysql-main/shipping.sql /tmp/"
            
        }
# provisioner "local-exec" {
#         command = "cd /tmp/"
            
#         }
provisioner "local-exec" {
        command = " mysql -h ${aws_db_instance.mysql.address} -uadmin1 -proboshop1 < /tmp/shipping.sql"
# check and remove this block if it doesnt work            
        }
 provisioner "local-exec" {
        command = "rm -rf /tmp/shipping.sql"
            
        }      

    }

