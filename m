Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C04C001DE
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 16:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjGLQNR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 12:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjGLQNP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 12:13:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397CA1FC7;
        Wed, 12 Jul 2023 09:12:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2B626182F;
        Wed, 12 Jul 2023 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388E6C433C7;
        Wed, 12 Jul 2023 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689178315;
        bh=bH0DeCWEj3solc5M8hUdxlWNDNxPeR7LxdcRzSf/Kvg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OzVtnLwpbNJrL7/0tfRuqkoJGpHYL6TaGYcyKNUcpBqHyYwnU1gZCJdTqasHxPt9F
         jf4Yh/aO9/a2nVsroYmcrKbUSTtBn120pwkFRPltibuJ6sooAVqTxCubhtmd+xNupt
         UzfAJElfpQHFPadRZDXOZgdsIFCKVQZjA/EBkpKjvbKWE++2H9FvoTvfMFGkaZu6WO
         p69yBIwbmzFNpLekDz43ikII7anyt/8fVUaflpGK3us93DAx2dSgpZr7dp6R6ecRHL
         0zwC/A9ivM3X1rREbNomVrE74TwKmipwhP/PLcYclbHMAX1RDrUahDPWsti/XbPUga
         p0g3uvKtsljyg==
Date:   Wed, 12 Jul 2023 09:11:54 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as
 process docs
Message-ID: <20230712091154.7ad7561c@kernel.org>
In-Reply-To: <20230712161011.1339829-1-kuba@kernel.org>
References: <20230712161011.1339829-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 12 Jul 2023 09:10:11 -0700 Jakub Kicinski wrote:
>  F:	Documentation/process/
> +F:	Documentation/maintainer/

Ugh, and looking at it in the email client I remember that m comes
before p. I'll send a v2 tomorrow if nobody nacks.
