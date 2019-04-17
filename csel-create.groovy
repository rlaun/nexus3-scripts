import org.sonatype.nexus.selector.*;

def selectorManager = container.lookup(SelectorManager.class.name);

def slurper = new groovy.json.JsonSlurper();
def argJson = slurper.parseText(args);

if (selectorManager.browse().find { x -> argJson.name == x.name  } == null) {
  log.info('will create content selector ' + argJson.name + ' with CSEL: ' + argJson.csel);

  def selectorConfig = new SelectorConfiguration(
    name: argJson.name,
    type: 'csel',
    description: argJson.comment,
    attributes: ['expression': argJson.csel ]
  );
  selectorManager.create(selectorConfig);
  return 'CSEL created: ' + argJson.name;
} else {
  return 'Error: CSEL already exists: ' + argJson.name;
}


