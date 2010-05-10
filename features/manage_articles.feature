# language: pt
Funcionalidade: Gerenciar artigos
  Para manter meu blog sempre atualizado e pertinente
  como um blogueiro
  eu quero poder manipular meus artigos

  @wip
  Cenario: Criar um novo artigo
    Dado que eu estou em home page
    Quando eu clico "Novo artigo"
    E eu preencho com:
      | Título | Livrem-se dos cowboys                                 |
      | Texto  | Livrem-se dos cowboys, desenvolva software com testes |
    E eu pressiono "Criar"
    Entao eu deveria estar no artigo "livrem-se-dos-cowboys"
    E eu deveria ver "Livrem-se dos cowboys" em "title"
    E eu deveria ver "Livrem-se dos cowboys, desenvolva software com testes" em "article"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
