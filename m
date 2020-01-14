Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8531C33CB1
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:59:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 659BD214AF
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:59:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="bHf9rdhf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FDjpktMA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgANN7X (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 08:59:23 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43187 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgANN7X (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Jan 2020 08:59:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id DE33E573;
        Tue, 14 Jan 2020 08:59:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 14 Jan 2020 08:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=xt2WhR101VTdSL1pBOpFA1REpXC
        ceQ/D/foxdEP6gIM=; b=bHf9rdhfYMdoU2sNj26n6nxWYZW5TfSWi2VisWP2Vt6
        7x4Zs7hhELBKElg35M/hKAAuhPknWhXu1c0G02OHw22kFkcRYsL4nYKvdMVGuFi3
        86JgLrB3bEJteJqhtW77VLpq4q8Ph6mqT9NP5ZzTa5t/iX4lTBXhsvDypL/K/EYg
        iZ7pWkzArnJt81tJwO0FFBHi+sLBswXaEfa9MzDdUSl8bW4vSvL47Aoicwq5MnJt
        m/wI5KWUUfWUXgVCzuNhKNTEmW2lsdknIidMHqlBIAMIDTQgTDrB08qL4DY28pVo
        keeQtYnDxpb2G9cawifNjC6ugcvycMZ2kUp92OCSiNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xt2WhR
        101VTdSL1pBOpFA1REpXCceQ/D/foxdEP6gIM=; b=FDjpktMAjKdVsyWhL0jn8w
        9VKtHCujMJRMWtFqzH9YWri9pDIt+kylO+oQPgEYKcboERH5QvVUB0ww9IC/pSTN
        JQnr3mbJsIbH0tR1vlLk2tHlRFIH1MHtZBWg4sxFmxS0M2l/EP76cGMDD1v+ltM8
        w/E31ydXduJGWTq+VQPARFNnJq8QtUx6Aa6NnRayQjHKupGZanNCmraYeCMG80hA
        eoLhnJd71UDJC4tspx00xoFhUXe7vZuHE3LkOV5XRDkWelooNaZFKIdTb4Ry0vlw
        2RF9m5W8UdyyZOPesuHFaEBAQWboGyg0AliC0qUopkNl4WILt6OmCdmrsMw00Hbg
        ==
X-ME-Sender: <xms:OckdXtWi1p5ovcEw47iB6qbN0Ygsz_Z5T4jsfbFfj0Rm_o2NELKrnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehmrghtrhhigidroh
    hrghdpkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdekledruddtjeenucfrrghr
    rghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptd
X-ME-Proxy: <xmx:OckdXo_l9-areescH0QoTPj00mhVQdbK1JL0XNrF_z20GLiDV1sq4g>
    <xmx:OckdXnI6B8Fkw41WDGAeDLKOWmm_bR0tAbzI79evuqFLEup2JbALjw>
    <xmx:OckdXm2F3Tmei94jMyhsp4yUpKlLMKgCFN_2IhguK61o_JAZKVWwTg>
    <xmx:OckdXjqoocYBGy0j3wTmIZ7nP7SyMfPf4NKb2G3KTQeTXqxHN5B45g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id E86068005C;
        Tue, 14 Jan 2020 08:59:20 -0500 (EST)
Date:   Tue, 14 Jan 2020 14:59:13 +0100
From:   Greg KH <greg@kroah.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     workflows@vger.kernel.org
Subject: Re: matrix.org as a replacement for IRC?
Message-ID: <20200114135913.GA1691737@kroah.com>
References: <87d0bmkx1w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0bmkx1w.fsf@linux.ibm.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jan 14, 2020 at 06:35:47PM +0530, Aneesh Kumar K.V wrote:
> 
> Hi all,
> 
> Was there any discussion around using matrix.org or any other
> alternative as a replacement for IRC? This should help to avoid setting
> up irc proxy to keep track of discussion when the users are not online.
> 
> IIUC both KDE and mozilla switched to matrix as their IRC replacement.

Given that there is no kernel.org irc channel (officially), I don't see
how the tool that different developers use to chat matters, do you?

Also, there are tools like irccloud if you don't like running your own
irc proxy.  Or better yet, just be fine with being offline :)

thanks,

greg k-h
