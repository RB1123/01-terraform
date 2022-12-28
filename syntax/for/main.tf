provider "local" {
  region = "ap-northeast-2"
}

variable "names" {
  description = "Names to render"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

output "for_directive" {
	  value = <<EOF
	%{for name in var.names}
		${name}
	%{endfor}
		EOF
}
