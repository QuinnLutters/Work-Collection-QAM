members=[
    {name:`Quinn Lutters`,age:`17`,Snumber:`4903889`, pronounce:`his`,link:`http://i512232.hera.fhict.nl/index.html`},
    {name:`Furkan Smail`,age:`20`,Snumber:`4956389`, pronounce:`his`},
    {name:`Maxim Guida`,age:`?`,Snumber:`4195434`, pronounce:`his`},
    {name:`Maya Tsotscheva`,age:`19`,Snumber:`4924339`, pronounce:`her`},
    {name:`Sara Rabiei`,age:`?`,Snumber:`4922476`, pronounce:`her`,link:`http://i516671.hera.fhict.nl/`},
    {name:`Maksim Malko`,age:`?`,Snumber:`4471849`, pronounce:`his`},
]
function makeIntro(member){
    const h1=document.createElement(`h1`);
    h1.textContent=member.name;
    const p=document.createElement(`p`);
    p.textContent=`Our group member ${member.name} is ${member.age} years old and ${member.pronounce} studentnumber is ${member.Snumber}`;
    const section=document.createElement(`section`);
    const link=member.link;
    const linktoQ=document.createElement("a");
    linktoQ.setAttribute ("href",link);
    linktoQ.textContent=`click here to go to ${member.name} portfolio website`;
    section.appendChild(h1);
    section.appendChild(p);
    p.appendChild(linktoQ);
    return section;
};
members.forEach(member=>
    document.body.appendChild(makeIntro(member))
    );