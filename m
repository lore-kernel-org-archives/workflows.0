Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD709C001DF
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 16:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbjGYQye (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbjGYQy3 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 25 Jul 2023 12:54:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7B326A1
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 09:54:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1935E617B8
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 16:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC2C433C8;
        Tue, 25 Jul 2023 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690304031;
        bh=/A0lTAhkNgSmTXQ0kK7d1Uu8VK32mRbVOq6O0UhXz78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aBgnUHCJLbZN0YsBf/nocQSBJ5MqVJjBTcDslrwRRGnSc3Urhr6kDR3T6CPEkM2pA
         OIcmZT8hjkweL1uv1zq4zZZRfe5ARMSkS1a+2r9VW4wju/k97YqWLjnV0MPQ0WOL0L
         WgGoCDoZKVbOEucl9aolF+nvVGOxCewfi+SudSYU=
Date:   Tue, 25 Jul 2023 18:53:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     krzk@kernel.org, joe@perches.com, geert@linux-m68k.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH] scripts: checkpatch: steer people away from using file
 paths
Message-ID: <2023072555-stamina-hurray-b95c@gregkh>
References: <b6ab3c25-eab8-5573-f6e5-8415222439cd@kernel.org>
 <20230725155926.2775416-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725155926.2775416-1-kuba@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Jul 25, 2023 at 08:59:26AM -0700, Jakub Kicinski wrote:
> We repeatedly see noobs misuse get_maintainer by running it on
> the file paths rather than the patchfile. This leads to authors
> of changes (quoted commits and commits under Fixes) not getting
> CCed. These are usually the best reviewers!
> 
> The file option should really not be used by noobs, unless
> they are just trying to find a maintainer to manually contact.
> 
> Print a warning when someone tries to use -f and remove
> the "auto-guessing" of file paths.
> 
> This script may break people's "scripts on top of get_maintainer"
> if they are using -f... but that's the point.

Ok, I'll go fix up my local scripts, but you should change your subject
line to say "get_maintainer", not "checkpatch" :)

thanks,

greg k-h
