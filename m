Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7016C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AF19206A1
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLN034xt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbfJKN5K (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:57:10 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41148 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfJKN5K (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:57:10 -0400
Received: by mail-qk1-f195.google.com with SMTP id p10so8920157qkg.8
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ZDutqNzpM/BDctRBGcSO5U4xKdtrPFGCzg0dOLN9Wo=;
        b=hLN034xtCuLRj7k5Io0KAzHZ9BV2Jn68RT1lbJ1uHhCuWEj0eKG3vWzCj0xIaWwZnj
         VQjoddqki3v6h84zsQ0SoNE3uN2tFtyKKCl772Y2oSXAv8S2MQGQM/lHGy30tz+OHeKv
         LJEVu6bbHHPCY9gfA2Jm/DKyD7BokYDfMrsxgnXzSFJ16gL5CTA0IHrPqN1DP3vY0ULm
         xPTG1R+AS8uRKqnHc/RmtQ05F3dk7XUELgmjW1Iz6SK0pPSxONnR17xbxAZ/vqx03J7z
         NFOt/3aAqt9M8Sc+Suig5wxtDnCxatRe6bXjh/3kloDvx9KJmiTjlJTeDsON9/eYq9Uu
         GHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ZDutqNzpM/BDctRBGcSO5U4xKdtrPFGCzg0dOLN9Wo=;
        b=RY+W8zpYn4A+s4ZR7EW7Rk4fb6W/R/8aas0iZgbTeuxHHA42aNGKfspTMCxqy0nX9k
         APpioA9yniqiSai8c03OlTvnfY8srron4SlqmTEDG7oaQv+syAPuICCcRNsJve4eEwGm
         Y3gWk3c7tpGPq+XPIYZADL2Zsowx2bHWiqUoh0nFX2mr6Y9pu/8RQ4qL5Je1iwqnA2nK
         EtnHxW3KFYq8+X+mOsbjUBKpPUCh4fUCRiSg88lRw5zml6nIGZNDXA6iOEwpocExRVcZ
         CXhbxqdVLxas8BSP1g0duOXZQHprk4WTA/mxCBb2RZwHEiXbnaTyWLGQ5P3+oF3aMpw0
         m9Zg==
X-Gm-Message-State: APjAAAVAh3mntWTo+WnjIvpWLvwDJxxlmSX/S2uB52QDL4kooRWXsYdX
        wI8VIZMqn6XK18fprR70GbPUasFskQkYlddQSHLU1g==
X-Google-Smtp-Source: APXvYqwdk1tQk/J9ZKsFFwwsgkgYG6dIcCXBse/HxjyIvMJ2+aZZF/nFMRMED3W4aOY6dTJ0HwRKBiojb5iTMXxtRno=
X-Received: by 2002:a37:65d0:: with SMTP id z199mr14537294qkb.407.1570802227986;
 Fri, 11 Oct 2019 06:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr> <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
 <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net> <CACT4Y+aEPnZ=aniEZ4JxNSE21oExX3X0s2-LX+AdGx3Q0v=C4Q@mail.gmail.com>
 <882d9408-eb8d-0f32-ce7f-7e5f6e8b08fd@gandi.net>
In-Reply-To: <882d9408-eb8d-0f32-ce7f-7e5f6e8b08fd@gandi.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 15:56:55 +0200
Message-ID: <CACT4Y+aD=NMqeErSnq_5ssLT-ATuGEqaz7_t45FSrgHTybOFag@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Nicolas Belouin <nicolas.belouin@gandi.net>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 9:12 AM Nicolas Belouin
<nicolas.belouin@gandi.net> wrote:
> > <nicolas.belouin@gandi.net> wrote:
> >> On 10/10/19 1:56 AM, Konstantin Ryabitsev wrote:
> >>> On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
> >>>> One of my long-term visions is to have an agreed upon way to
> >>>> have entirely forkable development communities.  Git already
> >>>> gave us forkable code repositories.
> >>> FYI, this does already exist in the form of Fossil:
> >>> https://www.fossil-scm.org/home/doc/trunk/www/index.wiki
> >>>
> >>> The main reason why we can't really consider it is because it requires
> >>> moving away from git, which is a non-starter for anyone.
> >>>
> >>> -K
> >> Maybe the solution is to build such kind of features within git,
> >> many proposed solutions with tools over git or using git.
> >> A tool over git has the issue of conveying the data and making
> >> it non-centralized, whereas a tool using git is non-scalable because
> >> of the way git is *currently* storing things.
> >> Improving git to make it able to store many more objects (be it in-review
> >> commits or previous versions of patches) and then use it to get the kind
> >> of features we can envy from fossil.
> > Hi Nicolas,
> >
> > I am trying to imagine how a complete solution based on git could look
> > like, but I am failing. It seems that there is a number of problems
> > beyond scalability/storage.
> > First, that git probably should be orthogonal to the kernel source git
> > trees, right? People work with multiple kernel trees, sometimes
> > changes migrate, parts of a series can be merged into different trees,
> > etc.
> This I think can't be helped if going through a Merge/Pull request workflow
> as a request will always be seen as a whole applied to a specific tree,
> I agree
> though the external tool solution might help for tree migration though.
> And I
> don't really have a solution for these issues.
> > Then, do we do a single git where everybody has write access, or
> > per-developer git? If we do a global git and everybody has write
> > access, this looks somewhat problematic. If we have multiple
> > per-developer gits, then it does not solve the whole problem of
> > synchronization and data exchange, one can't pull from thousands of
> > unknown gits every time.
> For this one I thought of per-developer git with a branch per series
> with MR discussion attached to the branch on the developer side and on
> maintainer/reference tree side a reference indicating a remote MR is in
> progress, with only those kind of special refs being writable.
>
> On MR acceptance the discussion/history of branch gets into the maintainer/
> reference tree through the merge commit object and gets included
> whenever one
> pulls from this tree
>
> > Where is this git[s] are hosted?
> Wherever the developper/maintainer wants it to be hosted
> > What about force pushes?
> Well a force-push as per the rule of no changing the commits of a public
> branch
> end-up as new reference linking to the old one for traceability.
> > What about authorization/user identification?
> For this one I thought of a X.509 like tree where you need to get your
> key/identity signed
> by some kind of AC so that you create an account through that AC and can
> push on whatever tree
> that trust that AC or one of its parent. I thought about a root with two
> main branches one for
> "Anonymous" kind of registration where you can use something like OpenId
> to get identified
> and get your matching certificate signed and another one for "Higher
> trust" given to e.g Linus
> so he can sign his maintainers and so they can also sign sub-maintainers
> and so on. Then you can
> set-up your repository to trust the root if you want anyone to be able
> to push or some sub-AC to
> restrict and maybe even a depth restriction to allow a hierarchical work
> as done today.
> >
> > It would be nice to reuse git's persistent storage format and ability
> > to push/fetch incremental changes, but we would need to figure out
> > answers to these questions. Maybe I am missing something obvious.
> > Could you outline how a solution based on git could look like?
> > Also in this case git is only a transport layer (like email/SSB), it
> > won't solve the application layer (how patches/comments/issues/CI
> > results are described, systems that consume, act and present that,
> > etc). So building a solid transport, even if we will need to
> > reimplement some git functionality, will be a smaller part of the
> > overall effort. And building a solid transport layer that will solve
> > fundamental infrastructure problems well may be worth it.

Thanks! This clears some of my doubts.
However, I still don't see the complete picture:
1. If I setup a git on github (a new contributor), is it possible to
setup github repo to trust an AC? I have not seen such option. I
assume you need to be configuring you git server manually for this
type of thing?
2. Restricting write access to some refs. Again, this does not seem to
be possible with github. Is it possible with own stock server?
3. If the "comments" ref is writable, can user A delete user B's
comments? Can change/repo owner delete "unwanted" comments?
4. git transport will also need DoS/spam protection, right? Because
it's easy to create 1000 new users each sending 1000 new merge
requests.
5. To sync my local view of the world, I need to fetch, say, net tree
git, then from that find set of other git trees with pending merge
requests and pull these trees, right? There may be a potential problem
with availability: if people setup gits on github, gitlab, kernel.org,
private hostings, etc, some of them may be down.
