Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC913C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 07:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2019613B9
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 07:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhFQHcN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:32:13 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56699 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229580AbhFQHcM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 03:32:12 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 3623D5C0158;
        Thu, 17 Jun 2021 03:30:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 17 Jun 2021 03:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=0dnw0bidnQd2MiZwMne9Nu9JpCP
        kULLG1TLW20Kz4c0=; b=B0uJVegaLg2U1kc7sJxzsYqKIgqvzMpL47PUO9HHOuG
        PtkNXxeKLP+8dHwvUF5mkhVQXB0Y7yE55IGfCm1+t8I0qiWTwNxPRLl6h+iGIkU6
        WXn6BiuD4yJmJpUoq7B3xGCn5kbO3rXQUMaax8NtSha4F+NOq6R/zA8cMWYewuPm
        lgZVVz6J84TckixxGLWrdzoEerNrvz803gBgw+U+6ro4LVS5pFa5Tf3Ecmdf/SFb
        LeWiw52q7UVvbAmwjldN3X4feFZTjTVtYITfhF/WSDQKSlCaSPLeufiPjT7mnHpu
        jbf0wbVVo2fMmqGguvyWR8xhWPmzbRKn8f/NqzdADvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0dnw0b
        idnQd2MiZwMne9Nu9JpCPkULLG1TLW20Kz4c0=; b=RAHayhD4UVmX9L4UEHfra1
        tb4AX3VPLCq2z4v4bGW/0Dm3wLBzvo466Rp4KjXFu4a7eLVj7CM2jsnAQCWKKc56
        qWFTL+fmA0ucYur02ILVnquTqCAIPjqSpaMqUzFDH5YomY+yIM6m/lua8cQBsRnL
        iSr2kejexn6Q9ZmRy3lvw7bmG58ePZi7i8znbFfnBOIqSVwg7MPkaA9jlr7btaMT
        coZo8TbhYSdpgVLNBADnIrr5eF7SVHeGpJCzwv2ojTT24KuEEn23HEJecU6Oa76Z
        6592jsCVrrHGAfNqfPGaL/bnO26kVwMflicide5jkwszScX//uPx1gotIcwsXgtA
        ==
X-ME-Sender: <xms:_PnKYA1W9Ar_GaX-_cBqlCn8Mf9VA-M4S3vMsge8ztfPG9IX5Y7okQ>
    <xme:_PnKYLFtShEL3VZNoMRdZw3z4Q1pcjFLNhculnHFnfYDdql59lIcn9rIXJ2AnEgLv
    xCOxaDSK_2j_A>
X-ME-Received: <xmr:_PnKYI4Sys8D7gUelGvP4VpbfLqAvGazY8GeMMD-2OZtB0bBHm5BOwCPXvfEyfX2ptzUG8dMs9s5y4DB0dqHe0qFK_skMU4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeftddgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhephfeutd
    efffegfeeuvedvgfefkedufeeludevteefheejtdekhfffjeduvdevheefnecuffhomhgr
    ihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:_PnKYJ3mgImwrv0OVKB3wpvIZr2mEjJgO75ARCG1rCC2-1zxcd0-6w>
    <xmx:_PnKYDEDE1Z0gSuW7Xsw-iy0oyZSlit7ihJT1aSYhuogftLAj5rxnA>
    <xmx:_PnKYC_-CKsrL-njpxgEn_km_wG6lzjvY5Kh92Mbuvg5bkLzAXWn4g>
    <xmx:_fnKYHhc0-v7GTGqgPIho9WV4O-pmeOnFrt0rHgl_OSrrF93zDcxJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 03:30:04 -0400 (EDT)
Date:   Thu, 17 Jun 2021 09:30:02 +0200
From:   Greg KH <greg@kroah.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMr5+ibXI5huLy7h@kroah.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 01:18:13PM -0400, Konstantin Ryabitsev wrote:
> - My general assumption is that putting this bot on github.com/torvalds/linux
>   would not be useful, as this will probably result in more noise than signal.
>   I expect that subsystem maintainers would prefer to configure their own
>   GitHub projects so they can have full control on what kind of CI prechecks
>   must succeed before the series is sent out. Is that a valid assumption, or
>   should I be working towards having a single point of submission on each
>   forge platform (Github, Gitlab, etc)?

What ever repo you put this on, it's going to take constant maintenance
to keep it up to date and prune out the PRs that are going to accumulate
there, as well as deal with the obvious spam and abuse issues that
popular trees always accumulate.

Linus has already said to not do it on his "tree", and I offer a full
"all branches" kernel mirror on github as well, but I don't want to be
responsible for this type of mess.

So perhaps you get a new kernel.org "mirror" account somehow and put it
there?  But again, someone will be responsible for keeping it alive and
clean, a thankless task that will take constant work.

> - We can *probably* track when patch series get applied and auto-close pull
>   requests that are accepted -- but it's not going to be perfect (we'd
>   basically be using git-patch-id to match commits to pull requests). Or is it
>   better to auto-close the pull request right after it's sent to the list with
>   a message like "thank you, please monitor your email for the rest of the
>   process"? The latter is much easier for me, of course. :)

Auto-close is the only way to do this, otherwise someone will have to go
back and clean it up on their own.  Again, who is going to do that?

thanks,

greg k-h
