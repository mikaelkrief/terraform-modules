package test

import (
	"fmt"
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestTerraformAsg(t *testing.T) {
	t.Parallel()

	fixtureFolder := "./fixture"

	// Deploy the example
	test_structure.RunTestStage(t, "setup", func() {
		terraformOptions := configureTerraformOptions(t, fixtureFolder)

		// Save the options so later test stages can use them
		test_structure.SaveTerraformOptions(t, fixtureFolder, terraformOptions)

		// This will init and apply the resources and fail the test if there are any errors
		terraform.InitAndApply(t, terraformOptions)
	})

	// Check whether the length of output meets the requirement
	test_structure.RunTestStage(t, "validate", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, fixtureFolder)

		testAsgId := terraform.Output(t, terraformOptions, "application_security_group_id")

		fmt.Println(testAsgId)
		if len(testAsgId) <= 0 {
			t.Fatal("Wrong output application_security_group_id")
		}
	})

	// At the end of the test, clean up any resources that were created
	test_structure.RunTestStage(t, "teardown", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, fixtureFolder)
		terraform.Destroy(t, terraformOptions)
	})

}

func configureTerraformOptions(t *testing.T, fixtureFolder string) *terraform.Options {

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: fixtureFolder,

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{},
	}

	return terraformOptions
}
