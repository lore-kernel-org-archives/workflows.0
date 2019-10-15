Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870D5C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:29:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BBC520854
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 18:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="dT7/xjNH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfJOS35 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 14:29:57 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:60632 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbfJOS34 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 14:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1571164196; bh=Sn+LMPWk9B4lxhOqdlMnYeiXy1Y1W28Gvp6e+tTmpzM=;
        h=In-Reply-To:Date:To:Cc:Subject:From;
        b=dT7/xjNHm7w/aAAI1zZ+tQzWCm8EBuyWP2gaIKt9UJRj+qMUcOH/CHkw/u6zbVOB4
         Zg9e32Sg+R3e2TRzrZYJZxz2sGlhX3tfLo/b0EgPR/hlkg4MDKPirAyDtiMWfy1d8T
         lrlNI1PSK8o+D/Hq5cY4fkVjIMnGC0W4hFqlrnK8=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191015182642.GA1137327@kroah.com>
Date:   Tue, 15 Oct 2019 14:29:55 -0400
To:     "Greg KH" <gregkh@linuxfoundation.org>
Cc:     <workflows@vger.kernel.org>
Subject: Re: Emailing patchsets from the web on git.sr.ht
From:   "Drew DeVault" <sir@cmpwn.com>
Message-Id: <BXQB836GE1UH.3PDKJ4PWE4U32@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Oct 15, 2019 at 8:26 PM Greg KH wrote:
> On Mon, Oct 14, 2019 at 12:15:40PM -0400, Drew DeVault wrote:
> > Future improvements will include closer linkage with mailing lists,
> > suggested recipients, other stuff. Thoughts?
>=20
> It looks nice!
>=20
> Only thought I had was it seemed that the individual commit messages
> were done twice?  Once when you did the commit and once when you sent
> them out?  Or am I watching that wrong?

There are two steps, selecting the earliest commit and selecting the
latest one. This is used so you can specify a range of commits. It's a
little bit unintuitive, but this is necessary to meet a core promise of
Sourcehut, which is that every feature works without JavaScript. I may
later reduce this to one step by using optional JavaScript, we'll see.

It's a bit more intuitive when you're making your way through the UI
yourself, I think. If anyone here gives it a shot and has feedback to
send my way, I would be pleased to hear it.
