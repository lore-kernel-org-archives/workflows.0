Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DA4C4360C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 11:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1CC521850
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570881030;
	bh=bEyZTXEwTlVtTBkCPKYaN0R/zzY1picmHXN4SSRys/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=xNW/Vii1dNyTTtcluLwxBbQo7UxZPzOrQ0X16x63lw4tVL++6plSU4WWX0T1e2oE4
	 ryip14JNh6Li8Dfk3PXWeZ5Y5EjzzFnBy1gSec3h+YPN/ccfZpcZupmbKienjVYXHg
	 tRofgD1DF+kNJG4uerxnQ7AMetKR378OJ4jYKhKw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfJLLu3 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 07:50:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33054 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfJLLs3 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 12 Oct 2019 07:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lCP+Q5ah0t2stuuKy+42ak8y9fUuMIQUNKVfCgL1rlE=; b=ShAP+/NOepWdN0RjHCYGK6dHO
        8Y36n7HT59jrbjpgPfdzpdcqIBi9cZ8KSl8FhkLVoi/W5PC5e3m8VdL0ls8bQ8SEPSbUGTGKCw7V3
        PLLg/ht4fGsQm5gGVUUji3NBXAc2DXBk6p3XQbZI/u3U2Oi6qbEHb4pQKMf1VfR/Sj6hn5QlstVOO
        EhPJc343LTivmtutVP/pLmL9k5a3JgXQkXoEnRIw29U0okaZYKuMBWCv5RYs7FXRYqjrD4A/zNAvZ
        kjVQZxnapkeAkz+k/gGbJYm96e4nXeWqMlAsSOYEDn+1qO3aLKUT1EupbPGsQUycnv4ySBgOsIeuQ
        41zPyK6Kw==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iJFsq-0003mz-05; Sat, 12 Oct 2019 11:48:28 +0000
Date:   Sat, 12 Oct 2019 08:48:24 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>, workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191012084824.1518f13e@coco.lan>
In-Reply-To: <20191011193900.cx6ov6abwelzz2ey@chatter.i7.local>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
        <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
        <20191011193900.cx6ov6abwelzz2ey@chatter.i7.local>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Fri, 11 Oct 2019 15:39:00 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:

> On Fri, Oct 11, 2019 at 07:15:12PM +0200, Dmitry Vyukov wrote:

> >This may also need some form of DoS protection (esp as we move further
> >from email).  
> 
> Well, amusingly, there are ways of distributing git via decentralized 
> protocols (SSB, DAT, IPFS). They are all fairly immature, though, and 
> some of them are truly terrible ideas.
> 
> For the moment, our best protection against DoS attacks on git repos is 
> having many frontends, some powerful allies (e.g. see 
> kernel.googlesource.com), and DoS-avoidance by obscurity ("I can't push 
> to kernel.org right now, but you can pull my repo from my personal 
> server over here").

The way I see, some spammer could send git pushes to the public-inbox
with thousands of SPAM, with would be forever stored at the repository.

So, if we're willing to implement it, we should have already a
solution for it since the beginning.

The only solution that sounds viable for me is to have a pre-receive
hook at the git server that would be receiving the commits.

Such hook would be customizable via .git/config, enabling or disabling
the functionalities and setting the thresholds:

1) prevent commits with too many patches;

If the push have more than, let's say, 20 patches, it would
reject the PR.  Doing that should be easy.

2) prevent commits from the same person if a certain threshold of
patches per period of time exceeds.

For example, no single developer (except maybe for the inbox owner) 
should be allowed to send more than, let's say, 1000 messages per day.

3) Implement gray lists

That would be more complex, but I guess it would be possible to implement
a hook that, for example, would check if the push comes from a known 
person (with signed patches with known keys) and/or a know IP address.

If not, it would push the contents on a separate gray list repository,
rejecting the change at the main one, and adding a notice for the
maintainer when a new person is added to the gray list.

If the owner of the public-inbox decides to accept the patch, it will
simply merge the gray list for that committer at the main inbox, and
the developer will be accepted as someone to trust.

4) Implement black list

If a previously trusted developer starts spamming or badly behaving,
he would be added to a black list file. Anyone there will have any
pull requests silently discarded.


Thanks,
Mauro
