import org.sonatype.nexus.security.*;
import org.sonatype.nexus.selector.*;
import org.sonatype.nexus.security.privilege.*;
import com.google.common.collect.ImmutableMap

def slurper = new groovy.json.JsonSlurper();
def argJson = slurper.parseText(args);

def repoName = argJson.repo;
def cselName = argJson.csel;

def selectorManager = container.lookup(SelectorManager.class.name)
def securitySystem = container.lookup(SecuritySystem.class.name)
def authorizationManager = securitySystem.getAuthorizationManager('default')

selectorManager.browse().each {
  x -> log.info(x.name)
}


if (selectorManager.browse().find { x -> cselName == x.name  } == null) {
  return 'Error: No such content selector: ' + cselName
}
def csel = null;
selectorManager.browse().each {
  x -> if (x.name == cselName) {
    csel = x;
  }
}

// create content selector privilege for given repository
def releaseProperties = ImmutableMap.builder()
  .put('content-selector', cselName)
  .put('repository', repoName)
  .put('actions', '*')
  .build()

def releasePrivilege = new org.sonatype.nexus.security.privilege.Privilege(
    id: repoName  + '-' + cselName,
    version: '',
    name: repoName + '-' + cselName,
    description: 'Content Selector Release privilege',
    type: 'repository-content-selector',
    properties: releaseProperties
)
authorizationManager.addPrivilege(releasePrivilege)



