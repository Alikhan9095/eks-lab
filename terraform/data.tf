# Get avialable Availabilit Zone in the selected AWS regionaction 

data "aws_availability_zones" "available" {
  state = "available"
}

