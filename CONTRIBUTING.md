# How to contribute
NHSbuntu wants to make NHS IT less bad. By ensuring that IT systems are easy to
update for IT departments and giving front line NHS staff the tools they need
to do their job.

If you're an IT Professional, a clinician who codes (or one that doesn't) or
you're just interested in the NHS IT space you can help NHSbuntu meet it's goal.

# Getting started
*TODO* Explain the way that the overall project gets pulled together.

## Adding integration with NHS technology
The NHS has a big estate of technology it uses, most of which is locked into the
Windows ecosystem.

We use the Windows package manager Chocolatey to install these tools. You can
find examples of Chocolatey packages for NHS tools in the following repos:

- [NHS Digital Identity Agent](https://github.com/NHSbuntu/choco-nhs_ia)
- [TTP SystmOne](https://github.com/NHSbuntu/choco-tpp_systmone)

## Adding health-centric extensions
NHSbuntu isn't just trying to solve problems for IT departments.

There are a number of tools that ship with NHSbuntu that have been extended to
make life easier for end users in the NHS, these extensions are created via text
files that the software looks up and are easy to add new functionality to.

If you'd like to add an extension you can contribute to the following repos:

- [zazu-nhsbuntu](https://github.com/pacharanero/zazu-nhsbuntu)
