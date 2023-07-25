Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE0EB64DD
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 19:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjGYTwL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjGYTwK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 25 Jul 2023 15:52:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D373310D4
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 12:52:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 715E561883
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 19:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97292C433C8;
        Tue, 25 Jul 2023 19:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690314728;
        bh=XZgxjbZNq0MP0RMfcV+VzYH+0OZv78FM95RXeuhNOVQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jj8w92J12bzFsLv3jWv83HRB/fCuEMaNmYEaPRdFaq4ifCPReOftNb+uLH8XjuBxJ
         /hL8zDqM6rXcmZgd094Lwdo2uNWwN5OGimgI+kwskQD/PAPlDUrOpP8IjwpEOBTpQz
         Lx2sjvI7aRbI2EmL8/u2BwwRtI+hsqfZcnEveRDwor2UTLJJ8Gjyl/PiNQlYWa/CrB
         wfiI7kjplfF2dbFjyE/jHlMApUUTCoZUOA66DjjJe2RtuSxzndbkqFESmt0bDgtYCX
         PYI+jo//FJx5lgkAplvJ9AZZov31DsSbfy+YxJfbBRrTMjU2MeJnYB+FUaCoCijTYW
         GMS+KCujos7hw==
Date:   Tue, 25 Jul 2023 12:52:07 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     krzk@kernel.org, joe@perches.com, geert@linux-m68k.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH] scripts: checkpatch: steer people away from using file
 paths
Message-ID: <20230725125207.73387bfc@kernel.org>
In-Reply-To: <2023072507-smugness-landslide-bd42@gregkh>
References: <b6ab3c25-eab8-5573-f6e5-8415222439cd@kernel.org>
        <20230725155926.2775416-1-kuba@kernel.org>
        <2023072555-stamina-hurray-b95c@gregkh>
        <20230725101051.7287d7cf@kernel.org>
        <2023072507-smugness-landslide-bd42@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 25 Jul 2023 19:25:09 +0200 Greg KH wrote:
> I do:
> 	- git format-patch to generate the patch series.
> 	- run the generate_cc_list script which creates XXXX.info files
> 	  (the XXXX being the patch number) that contain the
> 	  people/lists to cc: on the patch
> 	- git rebase -i on the patch series and edit the changelog
> 	  description and paste in the XXXX.info file for that specific
> 	  patch.
> 
> Yeah, it's a lot of manual steps, I should use b4 for it, one of these
> days...

Oh, neat! I do a similar thing. Modulo the number of steps:

  git rebase --exec './ccer.py --inline'

I was wondering if I was the only one who pastes the Cc: person
into the patch, because I'd love to teach get_maintainer to do
the --inline thing, instead of carrying my own wrapper...
