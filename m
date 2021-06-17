Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A393DC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83D40613BA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhFQO36 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:29:58 -0400
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:46150 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231656AbhFQO36 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 10:29:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 99DE61280DB3;
        Thu, 17 Jun 2021 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1623940070;
        bh=5QsBE+shJfoczNXhBHCCTqHjlPNzyMy42qgBjtklVWI=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=GT2jH4b3gv2MTEVJd2NPPOKClGj1v2cFTsifuolwZDQZd2yNym0VijDyxiO/u35/C
         YwaITba37XYAOJtWRi1pzVPFcOX4wCn6Ra8EkrIii6x2Ef6vRSDA7i7ZHab5T1WNvP
         LDV/m+wHh03sV0nrIcZ0v/1NsAP8suxQ/b9ZbIQk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vbcZz5_kEcJC; Thu, 17 Jun 2021 07:27:50 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 35F981280DA4;
        Thu, 17 Jun 2021 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1623940070;
        bh=5QsBE+shJfoczNXhBHCCTqHjlPNzyMy42qgBjtklVWI=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=GT2jH4b3gv2MTEVJd2NPPOKClGj1v2cFTsifuolwZDQZd2yNym0VijDyxiO/u35/C
         YwaITba37XYAOJtWRi1pzVPFcOX4wCn6Ra8EkrIii6x2Ef6vRSDA7i7ZHab5T1WNvP
         LDV/m+wHh03sV0nrIcZ0v/1NsAP8suxQ/b9ZbIQk=
Message-ID: <62abb1a1c1e43e9e0c60b9dec7446328949cf2d1.camel@HansenPartnership.com>
Subject: Re: RFC: Github PR bot questions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Date:   Thu, 17 Jun 2021 07:27:49 -0700
In-Reply-To: <CAL_JsqKLoMkXSF6aYHhO-MPCmFiRBS-vozuEPhsVnDa_fbjh7g@mail.gmail.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
         <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
         <6e7b15d8e53cef179e11e87a5f96d64bebc38f32.camel@HansenPartnership.com>
         <CAL_JsqKLoMkXSF6aYHhO-MPCmFiRBS-vozuEPhsVnDa_fbjh7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 2021-06-17 at 08:18 -0600, Rob Herring wrote:
> On Wed, Jun 16, 2021 at 4:33 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > On Wed, 2021-06-16 at 15:11 -0600, Rob Herring wrote:
> > > > - subsystem maintainers can configure whatever CI pre-checks
> > > > they want before the series is sent to them for review (and we
> > > > can work on a library of Github actions, so nobody needs to
> > > > reimplement checkpatch.pl multiple times)
> > > 
> > > What about all the patches that don't come from the GH PR? Those
> > > need CI pre-checks too. We're going to implement CI twice? The
> > > biggest issue I have on CI checks is applying patches. My
> > > algorithm is apply to my current base (last rc1 typically) or
> > > give up. I'm sure it could be a lot smarter trying several
> > > branches or looking at base-commit (not consistently used) or the
> > > git diff treeish hashes. What I'd really like is some bot or
> > > script that's applying series and publishing git branches with a
> > > messageid to git branch tool. 0-day is doing this now. Basically,
> > > the opposite direction as others have mentioned.
> > 
> > I've got to say my experience with Github CIs has been pretty
> > unpleasant.  Pretty much every project I've ever pushed to has had
> > at least one commit reject because of a bug in the CI rather than
> > the commit which they usually dump on the submitter to fix.  As an
> > endless devops make work project, I'm sure they're fine, but what
> > we have now with 0-day is pretty much good enough for most kernel
> > work, plus if it goes wrong we can ignore it and somebody else
> > fixes it ...
> 
> It's the making a git branch somewhere that I'm interested in, not
> the Github part of it. If someone wants to tie GH CI to that and send
> out replies to patches, then fine. We can use them if useful or
> ignore if not.
> 
> 0-day is a bit unpredictable in terms of response time. I often only
> get reports after things land in linux-next which is a bit late IMO.
> What is run and the priorities are all opaque.

You can specifically ask it (or rather it's handlers) to send you or
the mailing list a success report when the tests you've requested have
run.  I think they also respond to triggers (please test this branch
now).

I suspect what we could all do with is a nice how 0-day can work for
you presentation from its handlers so all of us know all of the tricks.

James


