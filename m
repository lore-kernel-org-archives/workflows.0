Return-Path: <SRS0=20bu=4D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02236C352A3
	for <workflows@archiver.kernel.org>; Sat, 15 Feb 2020 22:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE2CA2083B
	for <workflows@archiver.kernel.org>; Sat, 15 Feb 2020 22:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=spwhitton.name header.i=@spwhitton.name header.b="SD+Mi51V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rgC2uyCm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgBOWXX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 15 Feb 2020 17:23:23 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55371 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726243AbgBOWXX (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 15 Feb 2020 17:23:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 11C1F465;
        Sat, 15 Feb 2020 17:23:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 15 Feb 2020 17:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spwhitton.name;
         h=from:to:subject:in-reply-to:references:date:message-id
        :mime-version:content-type; s=fm2; bh=a/sTCz5gPAzc6MO+kB78LjvaI7
        rum1IRPtq/M4ZhIng=; b=SD+Mi51VanmoY1CaoOI8bpJLqEb05MFLtQQ0ejEPd6
        +z+N1ym9bxRG2lbqIZ9TCHeKVaWsrK3crgSDuQid/vRVnZvSsrLZuGNZ+MpLJvev
        5DYe3CtTgbCYExgYvhZdt3cuKtx0Tp+7VxnPGtrn2nPgpzfpaD/Iw6kizZnFSz/7
        L5f8zYXO9p3bPf0T4JwUrpc+rVT9Hw+vyD7TPWmcv8+0sAP/sa5oJ80ufJturhIA
        e+LoVsdZwSfu74NWLL62x4neR+JqDD1mx78+y5Bqayk36ETjNWOGArgG6HzT53zO
        HRVWoQQprkM6CNovzl/D2IPHUvIY20Rq2GBlDU/c3+xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=a/sTCz
        5gPAzc6MO+kB78LjvaI7rum1IRPtq/M4ZhIng=; b=rgC2uyCmhBfgS7mdQ/osBe
        NEaXz9eOV59Du8sitTPHCwRP9NAI6AE0XtmgkLYF6RndGwFpjpa+XUl9cOWD5V2O
        IeLrbBW+vcIuSK2UEiO/Hdm6oEU+RBW5ZoJwnIC3GKmjF69XNg2YSWXX6tpYqdTb
        QeGWq5Vz32qqbyhHFUO5BnKLNWv0MepN4S0Uwv2/um4GaU1cABjwqIWwsmTBJOO3
        CqsZ/d0adrqzWKTIvJ7DAV5UW5AwWnNk3dICczkRZen0fdwWVE97JoJj8EMXEZW4
        rNX17HLDKLMcHOsn9JsZWeuVLSPrMOJJThFOjDlm7QfZX/XwyhKqHdr0LLjyyZrg
        ==
X-ME-Sender: <xms:WW9IXp4TfEIxR1HtxSujcYXlo7kQwxEI9JpCLEnkoiiwW9Z__zLo3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedvgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffujghffffkgggtsehttdertd
    dttddtnecuhfhrohhmpefuvggrnhcuhghhihhtthhonhcuoehsphifhhhithhtohhnsehs
    phifhhhithhtohhnrdhnrghmvgeqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsh
    hpfihhihhtthhonhdrnhgrmhgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepshhpfihhihhtthhonhesshhpfihhihhtthhonhdrnhgrmhgv
X-ME-Proxy: <xmx:WW9IXif1LajXFtMC4iRZcYEkxfltPaXBtJLtN3F75vGNHuayxtDIjg>
    <xmx:WW9IXgcIwYXW98accQopE1V0Xng_hUFZ4NCszjUpuZm2a4ycLiiDUQ>
    <xmx:WW9IXnGoK9sgUlLHDysnTz0exRjfNfmyDSLnnzDo46g9YCi5IebhIg>
    <xmx:WW9IXkahRnWXPHxymAspjnCBGN6se_O512Qj0Y4E8zsn7pav5W2Meg>
From:   Sean Whitton <spwhitton@spwhitton.name>
To:     workflows@vger.kernel.org, ~sircmpwn/sr.ht-discuss@lists.sr.ht
Subject: mbox-export-patch, notmuch-export-patch
In-Reply-To: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
References: <20200201030105.k6akvbjpmlpcuiky@chatter.i7.local>
Date:   Sat, 15 Feb 2020 15:23:19 -0700
Message-ID: <87lfp38p7s.fsf@iris.silentflame.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello,

On Fri 31 Jan 2020 at 10:01PM -05, Konstantin Ryabitsev wrote:

> Hi, all:
>
> I'd like your opinion on this quick helper script I wrote that uses any
> message-id to grab a full thread from lore.kernel.org and save it as a
> mbox file.
>
> What's more useful, it can also prepare a mbox that you can pass
> straight to git-am:
>
> - it will tally up all "Acked-by", "Reviewed-by" etc trailers and add
>   them to the proper patch headers
> - it will properly sort patches in the series, so you don't have to do
>   it manually

Inspired by some of this functionality, I just uploaded
'mbox-extract-patch' to Debian unstable in the 'mailscripts' package, or
here:

    script: https://git.spwhitton.name/mailscripts/tree/mbox-extract-patch

    docs: https://git.spwhitton.name/mailscripts/tree/mbox-extract-patch.1.pod

It does what get-lore-mbox.py does except without the kernel-specific
functionality, so it might be interesting for people wanting to use a
git-send-email(1)-based workflow for projects whose mailing lists are
not archived on lore.kernel.org.

mailscripts also contains a wrapper, notmuch-extract-patch, for notmuch
users.

-- 
Sean Whitton
