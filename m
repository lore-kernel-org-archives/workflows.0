Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0758CA9ECF
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 09:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 643072080F
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572599100;
	bh=ycpN4N3jnAmoSom5+U7UIAE+SKzPDvW+KNb6EW3xmu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NgB02FoOAwYw/CoGonTYAvHtAi1Fl7jQwHaKnK191x8qg3iJk7jbTUiOC9dRykIdX
	 mJtfqsxYwfyb41UoOsnp+8UrmNCBbtMVIz/v6QksObgu61apcn3tKRBWW9i8u2pbMR
	 hbQBX5Ww4cQ3Zc6hAqXWWbAjhhW1TTJ2Fuk+2aGE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfKAJFA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Nov 2019 05:05:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:57746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbfKAJFA (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 1 Nov 2019 05:05:00 -0400
Received: from localhost (unknown [84.241.195.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C079C2080F;
        Fri,  1 Nov 2019 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572599099;
        bh=ycpN4N3jnAmoSom5+U7UIAE+SKzPDvW+KNb6EW3xmu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YqchdBBZjKI0zAV80HbH0PiCXpAme66D58edYaAMmii6clSf7OnIxmJ9MHEUZGPsj
         kYbHRVaoaobSbcAIIMJUIWq0mTh9NSimcYC9ieG68W1dSqBQn4qp662QMqqmas32Fq
         yLAtd3W6mSvBPVlrmZ7mJZPJTJ+GnkIWgIjuLv+0=
Date:   Fri, 1 Nov 2019 10:04:56 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org
Subject: Re: patch attachments still unwelcome?
Message-ID: <20191101090456.GD2671695@kroah.com>
References: <20191101022746.GA25491@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101022746.GA25491@dcvr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Nov 01, 2019 at 02:27:46AM +0000, Eric Wong wrote:
> The BDFL sets an example by attaching patches:
> 
> https://lore.kernel.org/lkml/?q=f%3Atorvalds+n%3Apatch
> 
> So the documentation in the kernel advising against sending
> patch attachments seems hypocritical.  Changing the kernel docs
> allow patch attachments could be a good start to making life
> easier for contributors without SMTP or IMAP access.

It's not hypocritical, as lots of email clients still get this wrong and
make responding to attachments almost impossible.  Many do get it right,
but trying to document the differences here is quite difficult (I tried
once, gave up as it was a mess).

> Are many MUAs still incapable of handling them?
> mutt shows text patches inline, at least.

For most MUAs that send them, yes, but not for all.  I know of at least
2 that send text attachments in formats that mutt will not show it
inline, nor allow responding to them properly.  MacOS Mail is one easy
example to point to as getting this totally wrong.

So, if you know what you are doing, yes, this is fine, but it's still a
good idea to say "please do not do this" to make it easier for people
just starting out.

thanks,

greg k-h
