Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C98C0015E
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 17:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjGYRZO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 25 Jul 2023 13:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjGYRZN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 25 Jul 2023 13:25:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF23137
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 10:25:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3875D617DC
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 17:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C55CC433C8;
        Tue, 25 Jul 2023 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690305911;
        bh=frHNyIcinIpmwAciC31Q9QcrQ0+n4l7/X8fZGj2IHJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JMauvZ19ALA+OupcIfHyDZyqQw/ELOPRiCGbCqXsAEOzvP168eoah5kOknt939xwr
         tb1ru9mPdsemdswVGLZ0CbmOnr8+fsypeioPpKrnuh57DD7BjV33KSwtoYdzcT4L+c
         myT+GJKnsUGorxYLPxgTVXjD5Ll+NC4h/+eCL0KY=
Date:   Tue, 25 Jul 2023 19:25:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     krzk@kernel.org, joe@perches.com, geert@linux-m68k.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH] scripts: checkpatch: steer people away from using file
 paths
Message-ID: <2023072507-smugness-landslide-bd42@gregkh>
References: <b6ab3c25-eab8-5573-f6e5-8415222439cd@kernel.org>
 <20230725155926.2775416-1-kuba@kernel.org>
 <2023072555-stamina-hurray-b95c@gregkh>
 <20230725101051.7287d7cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725101051.7287d7cf@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jul 25, 2023 at 10:10:51AM -0700, Jakub Kicinski wrote:
> On Tue, 25 Jul 2023 18:53:48 +0200 Greg KH wrote:
> > > This script may break people's "scripts on top of get_maintainer"
> > > if they are using -f... but that's the point.  
> > 
> > Ok, I'll go fix up my local scripts,
> 
> Which one? I spotted this in your repo but it already seems
> to use patches:
> 
> https://github.com/gregkh/gregkh-linux/blob/master/scripts/generate_cc_list

Oh yeah, it does work on patches.  Nevermind, I think I just use the -f
version manually when trying to figure out who to blame for a bug report
in a specific file :)

> How do you use this, BTW?

I do:
	- git format-patch to generate the patch series.
	- run the generate_cc_list script which creates XXXX.info files
	  (the XXXX being the patch number) that contain the
	  people/lists to cc: on the patch
	- git rebase -i on the patch series and edit the changelog
	  description and paste in the XXXX.info file for that specific
	  patch.

Yeah, it's a lot of manual steps, I should use b4 for it, one of these
days...

thanks,

greg k-h
