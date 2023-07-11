Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F36EB64DC
	for <workflows@archiver.kernel.org>; Tue, 11 Jul 2023 13:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjGKNwS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 11 Jul 2023 09:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjGKNwR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 11 Jul 2023 09:52:17 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186C499;
        Tue, 11 Jul 2023 06:52:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C818735D;
        Tue, 11 Jul 2023 13:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C818735D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689083535; bh=th7mU2Y52P3owRLZiI3vRPeVMIxGwFCBFlm93ZNUBws=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Rqwhyw6g6zzsff4NuNKIp2L7GFSVYYgtSp6RZO3j9FZD4lmAMzWEil64/I8p8UlHz
         XnCFQm0NUAFoOUbsv+nihT3nKLju5cLHHyeCbvm+7toWyhb/63WO+Os06yFaPrbqTh
         jlZuRoatDWbhdr9X30LQyUxHno7PptYLmzEvhwnhnlH5yqS4Ge/FmCXRBxiuug7ito
         AVEP3ieEyn2d8LVdyZTWIPTyolymVNjJaZp8LbkKYtpd4c41vf0ZiGKADMZxwh7I3f
         Kwano92y7Ka+y3fJfVxvfIqS08LUZBfXMiapph1a/MMW3qcoGtMEcLzfTidWs0gQmB
         2R/fDeQHuRskQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>, workflows@vger.kernel.org
Cc:     linux-doc@vger.kernel.org
Subject: Re: Docs for base maintainer expectations?
In-Reply-To: <20230710115239.3f9e2c24@kernel.org>
References: <20230710115239.3f9e2c24@kernel.org>
Date:   Tue, 11 Jul 2023 07:52:14 -0600
Message-ID: <875y6q8sj5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> do we have any docs describing what's expected from folks stepping up
> to maintain (small-ish) parts of the kernel like a driver or a protocol?
>
> Experienced developers / maintainers differ like the beautiful
> snowflakes that we are, but outsiders have much less familiarity 
> with the landscape, and frankly sometimes much less interest in
> participating once they code lands.
>
> Which makes we wonder if a simple list of responsibilities would be
> useful as a baseline. I haven't spotted anything in Docs/process but
> perhaps someone has a local version for their subsystem?

I think that would be good to have.  We often complain about a lack of
maintainers, but we have nothing to point to telling people how they can
step up and do that.

I've tried to fill in some pieces with the documents on merging and
such, but we're missing the introduction.

Thanks,

jon
