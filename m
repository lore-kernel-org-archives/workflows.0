Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E969DC49EA2
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:18:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDCCF613EC
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhFQOU0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:33806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231720AbhFQOUW (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 10:20:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB3526135C
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623939493;
        bh=8FwkkZGccm1/Gbe2KgXj+ejF3dsONfp1PxWgAJgHAQA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZM2dGzfBzVIyD+Es6mWTir3EnoazoqnBPXM4bJW4QPMzwkeul38j8CNRKZ1MBxgpb
         GqARmHYkguTgSQUlrtzkMUo43H16x7uO9sVJCTXmDlabpBZLN6MFjEe0TSJ1LJiF3+
         5kqSe0CwilxLXRPCobsfiBJ69ifcEmeaKQBVZqxjo6jbom/3p5+fIZaLsuS4HGFJrq
         FdBKhdJk+9Q0TX7PXtMP9WOBwQKv3/iRWRcFX+giJLJp62mHko28tsLxC/PHn13ltj
         5IUBhLmA4tGINjyv6yLt7WbJfwwol2PjPI/epHrqGvi1dT5UZdGuBxepj4IXJuvab1
         +GBbpGSEniddQ==
Received: by mail-ej1-f49.google.com with SMTP id nb6so10108579ejc.10
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:18:13 -0700 (PDT)
X-Gm-Message-State: AOAM530/5H+8bQ9zkFSWA8J1JKTRNB4C9DSacEpPcuN2Q/NbcMktEJYR
        eit312HD7UZPZlNRfkqORJ9baXoWrnpKZ7dVdQ==
X-Google-Smtp-Source: ABdhPJxFvX9FQs/d/Eszaf11q0ZUIiwOTyn3Rg5qQ1KeBURA1lawKXhQv6Bw3yiouoLGhLhBFSEaFKFfg4neqpLeh28=
X-Received: by 2002:a17:907:264b:: with SMTP id ar11mr5326163ejc.525.1623939492379;
 Thu, 17 Jun 2021 07:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <6e7b15d8e53cef179e11e87a5f96d64bebc38f32.camel@HansenPartnership.com>
In-Reply-To: <6e7b15d8e53cef179e11e87a5f96d64bebc38f32.camel@HansenPartnership.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 17 Jun 2021 08:18:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKLoMkXSF6aYHhO-MPCmFiRBS-vozuEPhsVnDa_fbjh7g@mail.gmail.com>
Message-ID: <CAL_JsqKLoMkXSF6aYHhO-MPCmFiRBS-vozuEPhsVnDa_fbjh7g@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 4:33 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2021-06-16 at 15:11 -0600, Rob Herring wrote:
> > > - subsystem maintainers can configure whatever CI pre-checks they
> > > want before the series is sent to them for review (and we can work
> > > on a library of Github actions, so nobody needs to reimplement
> > > checkpatch.pl multiple times)
> >
> > What about all the patches that don't come from the GH PR? Those need
> > CI pre-checks too. We're going to implement CI twice? The biggest
> > issue I have on CI checks is applying patches. My algorithm is apply
> > to my current base (last rc1 typically) or give up. I'm sure it could
> > be a lot smarter trying several branches or looking at base-commit
> > (not consistently used) or the git diff treeish hashes. What I'd
> > really like is some bot or script that's applying series and
> > publishing git branches with a messageid to git branch tool. 0-day is
> > doing this now. Basically, the opposite direction as others have
> > mentioned.
>
> I've got to say my experience with Github CIs has been pretty
> unpleasant.  Pretty much every project I've ever pushed to has had at
> least one commit reject because of a bug in the CI rather than the
> commit which they usually dump on the submitter to fix.  As an endless
> devops make work project, I'm sure they're fine, but what we have now
> with 0-day is pretty much good enough for most kernel work, plus if it
> goes wrong we can ignore it and somebody else fixes it ...

It's the making a git branch somewhere that I'm interested in, not the
Github part of it. If someone wants to tie GH CI to that and send out
replies to patches, then fine. We can use them if useful or ignore if
not.

0-day is a bit unpredictable in terms of response time. I often only
get reports after things land in linux-next which is a bit late IMO.
What is run and the priorities are all opaque.

Rob
