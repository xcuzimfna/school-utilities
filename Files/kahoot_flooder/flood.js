console.log("Preparing...")
readline = require('readline-sync');
console.log("Required readline-sync")
const Kahoot = require("kahoot.js-updated");
console.log("Required kahoot.js-updated")
var words = require('an-array-of-english-words')
console.log("Required an-array-of-english-words")
const fs = require('fs');
  


const cliProgress = require('cli-progress');
const { brotliCompressSync } = require('zlib');
console.log("Required cli-progress")

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
process.setMaxListeners(Number.POSITIVE_INFINITY)

fs.open('installed', 'w', (err, file) => {
    if (err) {
        throw err;
    }

    console.log("File is created.");
});


console.clear()


//QUESTIONS TO START FLOODING
pin = readline.question('Enter game pin> ');
bots = readline.question('Enter number of bots> ');
ranname = readline.question('Use random name? (y/n)> ');

if (ranname=="y"){
    ranname=true
}else{
    ranname=false
    botname = readline.question('Enter name> ');
    botprefix = readline.question('Enter prefix> ');
}
er = readline.question('Use name bypass? (y/n)> ');

usercontrolled = readline.question('Controll the bots? (y/n)> ');

if (usercontrolled=="y"){
    usercontrolled =true
}else{
    usercontrolled =false
}

//END QUESTIONS YAY
console.clear()//nice and clean uwu

var repeattimes=bots

function spam() {
    
      if(!repeattimes==0){
        bar.update((bots-repeattimes)+1)
        repeattimes--
        setTimeout(() => {
            spam()
        }, 20);
        setTimeout(() => {
            
            if(ranname){
                join(words[getRandomInt(1,words.length)],(bots-repeattimes-1))
            }else{
                join(botname+(botprefix+((bots-repeattimes-1))),(bots-repeattimes-1))
            }
        }, 20);
      }else{
          bar.stop()
          console.log("All join requests have finished.")
      }
}

process.setMaxListeners(Number.POSITIVE_INFINITY)

Arandomint = 0

function join(name,idee) {

    const client = new Kahoot();
    client.setMaxListeners(Number.POSITIVE_INFINITY)
    if(er=="y"){
        client.join(pin, name.replace(/a/g, 'ᗩ').replace(/b/g, 'ᗷ').replace(/c/g, 'ᑕ').replace(/d/g, 'ᗪ').replace(/e/g, 'E').replace(/f/g, 'ᖴ').replace(/g/g, 'G').replace(/h/g, 'ᕼ').replace(/i/g, 'I').replace(/j/g, 'ᒍ').replace(/k/g, 'K').replace(/l/g, 'ᒪ').replace(/m/g, 'ᗰ').replace(/n/g, 'ᑎ').replace(/o/g, 'O').replace(/p/g, 'ᑭ').replace(/q/g, 'ᑫ').replace(/r/g, 'ᖇ').replace(/s/g, 'ᔕ').replace(/t/g, 'T').replace(/u/g, 'ᑌ').replace(/v/g, 'ᐯ').replace(/w/g, 'ᗯ').replace(/x/g, '᙭').replace(/y/g, 'Y').replace(/z/g, 'ᘔ').replace(/A/g, 'ᗩ').replace(/B/g, 'ᗷ').replace(/C/g, 'ᑕ').replace(/D/g, 'ᗪ').replace(/E/g, 'E').replace(/F/g, 'ᖴ').replace(/G/g, 'G').replace(/H/g, 'ᕼ').replace(/I/g, 'I').replace(/J/g, 'ᒍ').replace(/K/g, 'K').replace(/L/g, 'ᒪ').replace(/M/g, 'ᗰ').replace(/N/g, 'ᑎ').replace(/O/g, 'O').replace(/P/g, 'ᑭ').replace(/Q/g, 'ᑫ').replace(/R/g, 'ᖇ').replace(/S/g, 'ᔕ').replace(/T/g, 'T').replace(/U/g, 'ᑌ').replace(/V/g, 'ᐯ').replace(/W/g, 'ᗯ').replace(/X/g, '᙭').replace(/Y/g, 'Y').replace(/Z/g, 'ᘔ'),["You","just","got","botted"]).catch(err=>{
            console.log("Failed to join: " + err.description || err.status);
        });
    }else{
        client.join(pin, name,["You","just","got","botted"]).catch(err=>{
            console.log("Failed to join: " + err.description || err.status);
        });
    }
    client.on("Joined", info => {
        
        
        if (info.twoFactorAuth){
            bot.answer2Step([getRandomInt(1,4),getRandomInt(1,4),getRandomInt(1,4),getRandomInt(1,4)])
        }else{
        }
    });

    client.on("TwoFactorWrong", function () {
        bot.answer2Step([getRandomInt(1,4),getRandomInt(1,4),getRandomInt(1,4),getRandomInt(1,4)])
    })
    client.on("TwoFactorCorrect", function () {
        console.log(name+" Got 2-factor correct!")
    })

    client.on("QuestionReady", question => {
        everyoneanswerthis=false
        if (question.type == "word_cloud") {
            if(usercontrolled){

                if (idee==1){
                    everyoneanswerthis=true
                    answer = readline.question('type your answer> ');
                    everyoneanswerthis=answer
                    Arandomint=answer
                    setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                }else{
                    var waittill=setInterval(() => {
                        if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                            clearInterval(waittill);
                            setTimeout(() => {
                                client.answer(Arandomint)
                            },getRandomInt(1,10000));
                        }
                    }, 100);
                   
                }
            }else{
                console.log(name+" answered with 'kahootflood.weebly.com'")
                setTimeout(() => {client.answer("kahootflood.weebly.com")},getRandomInt(1,10000));
            }
        }

        if (question.type == "jumble") {
            console.log("User controlling is not currently available for jumbles. The bot "+name+" responded with a random answer.")
            setTimeout(() => {client.answer(getRandomInt(0,question.quizQuestionAnswers[question.questionIndex]-1))},getRandomInt(1,10000));
        }

        if (question.type == "quiz") {
            if(usercontrolled){
                if(question.quizQuestionAnswers[question.questionIndex]==2){

                    
                    if (idee==1){
                        everyoneanswerthis=true
                        answer = readline.question('t for triangle, d for diamond> ');
                        answer = answer.replace('t', 1).replace('d', 2)
                        everyoneanswerthis=answer
                        Arandomint=answer
                        setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                    }else{
                        var waittill=setInterval(() => {
                            if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                                clearInterval(waittill);
                                setTimeout(() => {
                                    client.answer(Arandomint-1)
                                },getRandomInt(1,10000));
                            }
                        }, 100);
                       
                    }


                }



                if(question.quizQuestionAnswers[question.questionIndex]==3){

                    if (idee==1){
                        everyoneanswerthis=true
                        answer = readline.question('t for triangle, d for diamond, c for circle> ');
                        answer = answer.replace('t', 1).replace('d', 2).replace('c', 3)
                        everyoneanswerthis=answer
                        Arandomint=answer
                        setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                    }else{
                        var waittill=setInterval(() => {
                            if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                                clearInterval(waittill);
                                setTimeout(() => {
                                    client.answer(Arandomint-1)
                                },getRandomInt(1,10000));
                            }
                        }, 100);
                       
                    }
                }



                if(question.quizQuestionAnswers[question.questionIndex]==4){

                    if (idee==1){
                        everyoneanswerthis=true
                        answer = readline.question('t for triangle, d for diamond, c for circle or s for square > ');
                        answer = answer.replace('t', 1).replace('d', 2).replace('c', 3).replace('s', 4)
                        everyoneanswerthis=answer
                        Arandomint=answer
                        setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                    }else{
                        var waittill=setInterval(() => {
                            if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                                clearInterval(waittill);
                                setTimeout(() => {
                                    client.answer(Arandomint-1)
                                },getRandomInt(1,10000));
                            }
                        }, 100);
                       
                    }


                }
            }else{


              
                setTimeout(() => {
                    toanswer=getRandomInt(0,question.quizQuestionAnswers[question.questionIndex]-1)
                    console.log(name+" answered with a random answer.")
                    client.answer(toanswer)
                },getRandomInt(1,10000));
                
            }
        } 


        if (question.type == "survey") {
            if(usercontrolled){
                if (idee==1){
                    everyoneanswerthis=true
                    answer = readline.question('t for triangle, d for diamond, c for circle or s for square > ');
                    answer = answer.replace('t', 1).replace('d', 2).replace('c', 3).replace('s', 4)
                    everyoneanswerthis=answer
                    Arandomint=answer
                    setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                }else{
                    var waittill=setInterval(() => {
                        if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                            clearInterval(waittill);
                            setTimeout(() => {
                                client.answer(Arandomint-1)
                            },getRandomInt(1,10000));
                        }
                    }, 100);
                   
                }
                
            }else{
                setTimeout(() => {
                    toanswer=getRandomInt(0,question.quizQuestionAnswers[question.questionIndex]-1)
                    console.log(name+" answered with a random answer.")
                    client.answer(toanswer)
                },getRandomInt(1,10000));
            }
        } 

        if (question.type == "open_ended") {
            if(usercontrolled){
                if (idee==1){
                    everyoneanswerthis=true
                    answer = readline.question('type your answer> ');
                    everyoneanswerthis=answer
                    Arandomint=answer
                    setTimeout(() => {client.answer(answer-1)},getRandomInt(1,10000));

                }else{
                    var waittill=setInterval(() => {
                        if (!everyoneanswerthis==false || !everyoneanswerthis==true){
                            clearInterval(waittill);
                            setTimeout(() => {
                                client.answer(Arandomint)
                            },getRandomInt(1,10000));
                        }
                    }, 100);
                   
                }
            }else{
                console.log(name+" answered with 'kahootflood.weebly.com'")
                setTimeout(() => {client.answer("kahootflood.weebly.com")},getRandomInt(1,10000));
            }
        }


    });

    client.on("QuestionEnd", data => {
        if (data.isCorrect){
            console.log(name+" Got it correct!")
        }else{
            console.log(name+" Got it wrong.")
        }
    })
    client.on("QuizEnd", data => {
        console.log("The quiz has ended and "+name+" got rank "+data.rank)
    })
    process.on("SIGINT", function () {
        process.exit()
    });
}

//INITIATE OF THE SPAM SPAM
console.log("Joining bots")
const bar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
bar.start(bots, 0);
spam()//YAY WE DID IT
