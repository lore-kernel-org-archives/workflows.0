Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6360C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7485E21835
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570819916;
	bh=Jk+ZIDAcez3benFgnKMc9WcFImJxYzADABdMxmTq/5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=e7jS6OF1VVW3OMnInaMvmw8amQm/tdZlezBI7zyz7S+sOKTMVFpUZLeSpURrazcFA
	 pdseYZBQuWH+NUqvRmT6dpa0sN8MMsC15Bd5e89nMQnw3qLg3WNPhSb9Uzv3ICV1Xt
	 2w97EdONSB/ut6eQkPYAaamQGwQy3AAUl22z/l8I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbfJKSv4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:51:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56856 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbfJKSv4 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 14:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iBwjlbLB3uFKb+0nDOs3doPy2J/IFoRhCRt526yP/H8=; b=jnrMkyZUP4NOf/jNveqbkD8AA
        /4dCaAzFkmhVNRaRxZhaf6dMXIsFMfndwnZHlVj7AOSuR75je0udjbTJy2tZBEAQQp/YRgVgTQtYs
        nCcuhDmGMO4M8X3fXGwW8qA5gUDcnX0s95GyR2gMKqIXeKQimuOAZ8duq+NO+DUcJMLflrhNzfS8D
        lL52kNktGSm+bi4UPBnvI+8GUSW7psIu1Vyg02zfokAZtzvmOkyqZHbMcwUKbENECF+4oB+0CiE96
        NgRwvKrqk2Ugxh1czez73xU9N8PPWGDjKOu4xmg1WRJR/g0/3aTHM1K96XzPa+C/MipKnk+o0Fh2W
        wtL2aM7AQ==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJ010-00042t-IK; Fri, 11 Oct 2019 18:51:50 +0000
Date:   Fri, 11 Oct 2019 15:51:46 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     David Miller <davem@davemloft.net>, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011155146.31105cc1@coco.lan>
In-Reply-To: <20191011144401.61007c44@gandalf.local.home>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <20191011143744.4291b42d@coco.lan>
        <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011144401.61007c44@gandalf.local.home>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Fri, 11 Oct 2019 14:44:01 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Fri, 11 Oct 2019 11:32:54 -0700 (PDT)
> David Miller <davem@davemloft.net> wrote:
> 
> > From: Steven Rostedt <rostedt@goodmis.org>
> > Date: Fri, 11 Oct 2019 14:01:08 -0400
> >   
> > > Thus, if we want people to send us their fixes, we better keep just
> > > an email with a patch the lowest bar for entry.    
> > 
> > I argue that for people coming into the software engineering world
> > today, a PR is the lowest bar for entry.  And email is the exact
> > opposite, _especially_ our way of doing email.
> > 
> > Because it IS NOT just an email with a patch.  
> 
> That is if the maintainer wants to be anal about the submission. I've
> taken patches where I only asked the person to give me a signed off by.
> I also ask:
> 
> "Hi, do you intend on being a contributor, or do you only want to get
> this fix upstream? If the latter, I will handle the change log and
> other formatting for you, all I need is the signed-off-by. Otherwise, I
> will help you submit a proper patch."
> 
> Again, this is for one offs, where someone found something like an off
> by one error or other trivial bug to fix. I just want the fix in, but
> will let the submitter decide how strict I will be to get it in. I've
> had people say "I don't care, just get it fixed", and I do the
> formatting and all the grudge work, but still give the submitter the
> credit.
> 
> Not to mention, there's several times I get a patch where the solution
> is totally wrong, and I need to make the fix anyway. A simple
> Reported-by is what the submitter gets. Also, perfectly done by email.
> 

About the same here: if needed, I change patch descriptions, and
for trivial patches submitted by newbies, I even correct bad whitespacing,
if needed.

All it takes for a patch to be handled is to send it in a way that
patchwork will recognize as a patch - e. g. it should carry a properly
formatted diff.

> > 
> > You are not helping casual contributors with this "simple" email based
> > submission method.  It is understood and easy us, but nobody else.  
> 
> I'm not saying that email is the only way, this entire thread is about
> getting another tool to help. But I will scream very loudly if we
> eliminate email totally.

Yes, e-mail should stay.

Thanks,
Mauro
