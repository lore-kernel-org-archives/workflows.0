Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65742C48BE8
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 22:33:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31A0C61078
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 22:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbhFPWgD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 18:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbhFPWgD (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 18:36:03 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E745FC061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 15:33:56 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 386B21280E4F;
        Wed, 16 Jun 2021 15:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1623882836;
        bh=rHTCrSakl7D3L5z2oi/15oj8+bjV6bvoTcX5hRBr+tM=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=gpiDCfOTtzJ0CsnT3b0snjMfmq3ZwW1T0DhMkvVrBAdvpEIHM0lQICNG7EoqdaGkg
         wn3P5qFfv3Xe4T6B+QnQj0J7DODKLi1wevIYMvUEFvJi62V3LCGF3MJMJyxrL9pz7m
         VYB1AmbJinPd+Yctmt7iiO/v/QE1ef6TAb+mVigo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4hfiu7lg1fNN; Wed, 16 Jun 2021 15:33:56 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D8A441280E4E;
        Wed, 16 Jun 2021 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1623882836;
        bh=rHTCrSakl7D3L5z2oi/15oj8+bjV6bvoTcX5hRBr+tM=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=gpiDCfOTtzJ0CsnT3b0snjMfmq3ZwW1T0DhMkvVrBAdvpEIHM0lQICNG7EoqdaGkg
         wn3P5qFfv3Xe4T6B+QnQj0J7DODKLi1wevIYMvUEFvJi62V3LCGF3MJMJyxrL9pz7m
         VYB1AmbJinPd+Yctmt7iiO/v/QE1ef6TAb+mVigo=
Message-ID: <6e7b15d8e53cef179e11e87a5f96d64bebc38f32.camel@HansenPartnership.com>
Subject: Re: RFC: Github PR bot questions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Rob Herring <robh@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Date:   Wed, 16 Jun 2021 15:33:54 -0700
In-Reply-To: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
         <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 2021-06-16 at 15:11 -0600, Rob Herring wrote:
> > - subsystem maintainers can configure whatever CI pre-checks they
> > want before the series is sent to them for review (and we can work
> > on a library of Github actions, so nobody needs to reimplement
> > checkpatch.pl multiple times)
> 
> What about all the patches that don't come from the GH PR? Those need
> CI pre-checks too. We're going to implement CI twice? The biggest
> issue I have on CI checks is applying patches. My algorithm is apply
> to my current base (last rc1 typically) or give up. I'm sure it could
> be a lot smarter trying several branches or looking at base-commit
> (not consistently used) or the git diff treeish hashes. What I'd
> really like is some bot or script that's applying series and
> publishing git branches with a messageid to git branch tool. 0-day is
> doing this now. Basically, the opposite direction as others have
> mentioned.

I've got to say my experience with Github CIs has been pretty
unpleasant.  Pretty much every project I've ever pushed to has had at
least one commit reject because of a bug in the CI rather than the
commit which they usually dump on the submitter to fix.  As an endless
devops make work project, I'm sure they're fine, but what we have now
with 0-day is pretty much good enough for most kernel work, plus if it
goes wrong we can ignore it and somebody else fixes it ...

James


