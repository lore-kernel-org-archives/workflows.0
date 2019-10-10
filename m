Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC48C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 14:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4A58206B6
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 14:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i009RdCd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfJJOV1 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:21:27 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:41380 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfJJOV1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 10:21:27 -0400
Received: by mail-qt1-f171.google.com with SMTP id v52so8924787qtb.8
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jcffk1DQuvXMW+Y1GrDDa1B4xT9hrGm1YK7BbxbDlNA=;
        b=i009RdCdcVpCTivoU2QKdBiCeH7dQsc+MlaEdJHkr3x/NwW/2vj5VRpleHGVWetmmf
         GfhbyKKP2CEQxE7meElUaaW7SjxCRImaeyG5bgf4rVMf48t6IkQD4HvdYefXIL4JE554
         ZHES4/JCG5vFrTaFyHJG5Nur2yCpGs0g8E5ivSxkkyT7Kfyu1MnrRnzkljYDOaRw6HWu
         fYxBNuJU9ZcLMRMbIrduqrEMOnmEmDIEB1s/zTj7yr7P1j8Fu6E96qXtSdNdZwvKHyqJ
         itCzPq/GTtedfg054r94fWV66fuu99LHeAR1G5C1Zo5XVd6tIGqjfVGoUOFeco+mjLWI
         0v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jcffk1DQuvXMW+Y1GrDDa1B4xT9hrGm1YK7BbxbDlNA=;
        b=dD1vUSiv+xdYm70ChRDZGK7OvgQvWbc98VryO9H9USYn2zZlxUuxmYZf5WMC8tNmZP
         HUNN9HVuANo/Z1KNMszXiPtvh3JMOO1E7FitMO1I8l2rP2j17SqpHyrPxphEMdBE7EEq
         SySAFEGsojoQ106A8TffWmNWo+hTEvny2Ole6tWuGclg+wF2S7yxRcc3DB+IbtUOYViV
         6prAka9of0wsOMy6gHXCm6EMuUOzJJnjozoU+hssieLHOXYfjmoOuezlasF3hPkYHzJ5
         8w/VYcn/l67MMKDqWcmevpqmA1Cc671jKzuJAsMAsowcWDqzB3NiXzBAFbIS7PScFaco
         brCg==
X-Gm-Message-State: APjAAAVkA2hwSePF8HELSULyN5Rf6d/8HfDWu6LqXTgwdEJw+edTkHAj
        Pz4BZIYbnKaxIhHqyXgauRCADOjJ8nQi9iU/39PGYA==
X-Google-Smtp-Source: APXvYqzX+Ur5DJKv7dSuaFWXBmtr4Q+SS9rUUW4ZvFVJ1mMLP9H0bB3a5SCzPzdctyngkiBPn3IkMDn6o7qEk6BlJrA=
X-Received: by 2002:ac8:73c8:: with SMTP id v8mr10584014qtp.158.1570717285588;
 Thu, 10 Oct 2019 07:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr> <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
 <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
In-Reply-To: <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Oct 2019 16:21:12 +0200
Message-ID: <CACT4Y+aEPnZ=aniEZ4JxNSE21oExX3X0s2-LX+AdGx3Q0v=C4Q@mail.gmail.com>
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

On Thu, Oct 10, 2019 at 9:39 AM Nicolas Belouin
<nicolas.belouin@gandi.net> wrote:
>
> On 10/10/19 1:56 AM, Konstantin Ryabitsev wrote:
> > On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
> >> One of my long-term visions is to have an agreed upon way to
> >> have entirely forkable development communities.  Git already
> >> gave us forkable code repositories.
> > FYI, this does already exist in the form of Fossil:
> > https://www.fossil-scm.org/home/doc/trunk/www/index.wiki
> >
> > The main reason why we can't really consider it is because it requires
> > moving away from git, which is a non-starter for anyone.
> >
> > -K
> Maybe the solution is to build such kind of features within git,
> many proposed solutions with tools over git or using git.
> A tool over git has the issue of conveying the data and making
> it non-centralized, whereas a tool using git is non-scalable because
> of the way git is *currently* storing things.
> Improving git to make it able to store many more objects (be it in-review
> commits or previous versions of patches) and then use it to get the kind
> of features we can envy from fossil.

Hi Nicolas,

I am trying to imagine how a complete solution based on git could look
like, but I am failing. It seems that there is a number of problems
beyond scalability/storage.
First, that git probably should be orthogonal to the kernel source git
trees, right? People work with multiple kernel trees, sometimes
changes migrate, parts of a series can be merged into different trees,
etc.
Then, do we do a single git where everybody has write access, or
per-developer git? If we do a global git and everybody has write
access, this looks somewhat problematic. If we have multiple
per-developer gits, then it does not solve the whole problem of
synchronization and data exchange, one can't pull from thousands of
unknown gits every time.
Where is this git[s] are hosted?
What about force pushes?
What about authorization/user identification?

It would be nice to reuse git's persistent storage format and ability
to push/fetch incremental changes, but we would need to figure out
answers to these questions. Maybe I am missing something obvious.
Could you outline how a solution based on git could look like?
Also in this case git is only a transport layer (like email/SSB), it
won't solve the application layer (how patches/comments/issues/CI
results are described, systems that consume, act and present that,
etc). So building a solid transport, even if we will need to
reimplement some git functionality, will be a smaller part of the
overall effort. And building a solid transport layer that will solve
fundamental infrastructure problems well may be worth it.
