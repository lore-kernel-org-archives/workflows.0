Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90632EB64DC
	for <workflows@archiver.kernel.org>; Mon, 10 Jul 2023 19:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjGJTWd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjGJTWc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jul 2023 15:22:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81240127;
        Mon, 10 Jul 2023 12:22:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D3FD611A5;
        Mon, 10 Jul 2023 19:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0B8C433C7;
        Mon, 10 Jul 2023 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689016949;
        bh=wxWgLz52AnesZVdx6RgGhUQax+3hHGwkyhn0cHi0ZZ8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UhlxtYPSOCa+lRx7VKqgZGaxxd3DVR1wQGgs7090E93nWmrOcrkdmAbFKBZfpAjPz
         GNN8a3bpmn3egkTWSUymWLwvW+Jj6+y9bOHodxs5eeonl2LNzHN/l0bLWuQxK7xl/V
         7vq6XsRuq7G647FkLOVPIn55zWcxy7c+rQT0aDrLrATLXiNf5ztWUCGEngha+sodbu
         6mkjJZiI/p9ecuJYoygW/vG3Dj16lMY3K9X6X5lsHFpSMtYiNfSAzOG2giyQ6fJS5W
         oq5kIiABT73c0OYHGuS4iFpSSU60VFrqX3UEFZkC69aU28LDdLyLNRjTcxndyA+aul
         aympZUlo9cHtQ==
Date:   Mon, 10 Jul 2023 12:22:28 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: Docs for base maintainer expectations?
Message-ID: <20230710122228.545d93be@kernel.org>
In-Reply-To: <20230710-snowboard-bannister-7ed66c8d742b@spud>
References: <20230710115239.3f9e2c24@kernel.org>
        <20230710-snowboard-bannister-7ed66c8d742b@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 10 Jul 2023 20:06:56 +0100 Conor Dooley wrote:
> On Mon, Jul 10, 2023 at 11:52:39AM -0700, Jakub Kicinski wrote:
> > do we have any docs describing what's expected from folks stepping up
> > to maintain (small-ish) parts of the kernel like a driver or a protocol?
> > 
> > Experienced developers / maintainers differ like the beautiful
> > snowflakes that we are, but outsiders have much less familiarity 
> > with the landscape, and frankly sometimes much less interest in
> > participating once they code lands.
> > 
> > Which makes we wonder if a simple list of responsibilities would be
> > useful as a baseline.  
> 
> > I haven't spotted anything in Docs/process but
> > perhaps someone has a local version for their subsystem?  
> 
> Given I figure you did this on with a -rc1 based tree, which would mean
> that what I wrote probably does not fit the bill, but I tried to do
> something along these lines with
> https://docs.kernel.org/process/maintainer-soc.html
> for which my target audience was people picking up maintenance of
> DT/soc drivers, which I hope there'll be a few of in RISC-V land soon...
> 
> I suggested adding things to it, like putting the trees in linux-next
> etc, but review feedback suggested that was unsuited to a subsystem
> specific document.

Thanks for the pointer! I haven't read it before because I assumed
it'll describe workflow and suggestions for SoC sub-tree (which it
does?) I was thinking about something way more basic, like "you are
expected to reply to bug reports", "you are expected to investigate
syzbot problems" etc. :(

IOW the SoC guide reads more like "how to get your code accepted" rather
than "what are the externally-facing responsibilities of a maintainer".
