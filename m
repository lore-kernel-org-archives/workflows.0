Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF955C0015E
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 17:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjGYRK4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 25 Jul 2023 13:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbjGYRKz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 25 Jul 2023 13:10:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D0B1FCF
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 10:10:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 86E146181E
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2E7C433C7;
        Tue, 25 Jul 2023 17:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690305052;
        bh=0xkL2VzyJE8XpaEm9sLuKZsPT9jlQHS1SEOkHKt2KFo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YFK1yFSHufm1PnMxIdC2E1W1jnyd2zckONOEj2SfrQ1zkYxqMz+BfGGWNVDoIhfJ1
         Vf7mf9ficOMGg4/XvjI5UkrshMK1m4fLlYAvfyesFa7xi3vYYzh8LF3NxvHZzzs9xH
         V+uQ+2ZqCc3lmKNVoEv0taxPf+kgSTfcKaHM7t2JUKROVES55vG+f15+O69Y8whocT
         5ITRNjkYUZHctuIPxzi0YklOkAr9BkK7WDYbtq6MjrRxjcV5Vv1BOZ4ewxcd8YYgZL
         CE6gJuxDaXurqJdXQ2wwv6gvJq9c5CW9WJBntavX/yFRFSe1SnwKl39J8E68eJfha4
         gTRDcXCKv+y3w==
Date:   Tue, 25 Jul 2023 10:10:51 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     krzk@kernel.org, joe@perches.com, geert@linux-m68k.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH] scripts: checkpatch: steer people away from using file
 paths
Message-ID: <20230725101051.7287d7cf@kernel.org>
In-Reply-To: <2023072555-stamina-hurray-b95c@gregkh>
References: <b6ab3c25-eab8-5573-f6e5-8415222439cd@kernel.org>
        <20230725155926.2775416-1-kuba@kernel.org>
        <2023072555-stamina-hurray-b95c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 25 Jul 2023 18:53:48 +0200 Greg KH wrote:
> > This script may break people's "scripts on top of get_maintainer"
> > if they are using -f... but that's the point.  
> 
> Ok, I'll go fix up my local scripts,

Which one? I spotted this in your repo but it already seems
to use patches:

https://github.com/gregkh/gregkh-linux/blob/master/scripts/generate_cc_list

How do you use this, BTW?

> but you should change your subject
> line to say "get_maintainer", not "checkpatch" :)

Ugh, will do :)
