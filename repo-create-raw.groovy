import org.sonatype.nexus.selector.*;
import org.sonatype.nexus.repository.manager.*;

def repositoryManager = container.lookup(RepositoryManager.class.name)

def slurper = new groovy.json.JsonSlurper();
def argJson = slurper.parseText(args);


def newRepoName = argJson.name;

log.info('args:  name=' + newRepoName);

repositoryManager.browse().each { x -> 
  if ('raw' == x.format.value) { 
    log.info(x.name + ' ' + x.format.toString())
    log.info(x.configuration.toString())
  }
}


if (repositoryManager.browse().find { x -> newRepoName == x.name  } == null) {

  log.info('Creating raw repository ' + newRepoName);
  repository.createRawHosted(newRepoName)
} else {
  log.info('Docker repo ' + newRepoName + ' already exists');
}


