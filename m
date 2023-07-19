Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CCFC001DE
	for <workflows@archiver.kernel.org>; Wed, 19 Jul 2023 18:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjGSS1A (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjGSS07 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 19 Jul 2023 14:26:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C6C1FDC;
        Wed, 19 Jul 2023 11:26:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 71D02617CF;
        Wed, 19 Jul 2023 18:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94506C433C8;
        Wed, 19 Jul 2023 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689791207;
        bh=j2n5w0iDHqceFh/zcYF1K66xYVrTMsBMIJYklZgsxWM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DrbOiIEN2ubDOvjGPIpJDrhlkvoyjyIMPKIXE/FROKtOHrcxuXe6zFUYmB7vnnzFG
         eoY1Y/M/3H+4kTe6s5DABXltXwIE6uT0JqJOcLUNDm5OyvC+e/59yYZAzFdTEC+aOJ
         MQWcUrjl073N+K+owljRf+zo+B15xZiL85m11/TkcRTVJK/FGH8B6K1dgcNOrowlLo
         OXeI8mLHRWWRtynNp2PDT1bc8fPel+0dccVSBFV3EA2qLL1jdQK2aPTzvRlxYyE6uM
         6xthwltUrAJF5WnCwoenDR7w9I8pPd0yfGqt9JitbCAUdVEqAdeAQFDC2qVUlJmu/f
         MSWXFqoCVZUzA==
Date:   Wed, 19 Jul 2023 11:26:46 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        linux@leemhuis.info, krzk@kernel.org
Subject: Re: [PATCH docs v2] docs: maintainer: document expectations of
 small time maintainers
Message-ID: <20230719112646.52977803@kernel.org>
In-Reply-To: <71224ff9-98d0-4148-afb8-d35b45519c79@sirena.org.uk>
References: <20230718155814.1674087-1-kuba@kernel.org>
        <71224ff9-98d0-4148-afb8-d35b45519c79@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 18 Jul 2023 20:55:37 +0100 Mark Brown wrote:
> > +Maintainers must be human, however, it is not acceptable to add a mail=
ing
> > +list or a group email as a maintainer. Trust and understanding are the
> > +foundation of kernel maintenance and one cannot build trust with a mai=
ling
> > +list. =20
>=20
> If you're revising this I'd add a note about the L: tag in MAINTAINERS
> here, or possibly just adding a list in addition to humans.  It is
> sensible and often helpful for companies to want to get mail copied to a
> wider distribution list internally but they're not really what we mean
> by list since external people typically can't join them.

=F0=9F=91=8D=EF=B8=8F Added: "Having a mailing list *in addition* to humans=
 is perfectly
fine."
