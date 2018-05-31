require "./recipes_spec"

def generate_jennifer_app(template = "slang")
  system("./bin/amber new app -r $(pwd)/jennifer -d sqlite -t #{template}")

  # TODO: uncomment after merge https://github.com/amberframework/amber/pull/823
  # system("cd app && ../bin/amber g controller Information all")

  # TODO: uncomment after merge https://github.com/amberframework/amber/pull/818
  # system("cd app && ../bin/amber g model Data title:string body:text")

  system("cd app && ../bin/amber g scaffold Category title:string")
  system("cd app && ../bin/amber g scaffold Product title:string description:text category:reference")
  system("cd app && ../bin/amber g scaffold Comment body:text product:reference")
  system("cd app && ../bin/amber sam db:setup")
end

def code_formatting_status
  system("cd app && crystal tool format src config spec --check")
end

describe "Jennifer Reciper" do
  it "compiles and tests jennifer recipe with Slang templates" do
    generate_jennifer_app(template: "slang")
    code_formatting_status.should be_true
    build_app.should be_true
    test_app.should be_true
  ensure
    cleanup
  end

  it "compiles and tests jennifer recipe with ECR templates" do
    generate_jennifer_app(template: "ecr")
    code_formatting_status.should be_true
    build_app.should be_true
    test_app.should be_true
  ensure
    cleanup
  end
end
