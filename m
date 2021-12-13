Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4B3C433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 16:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbhLMQGa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 11:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbhLMQGa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 11:06:30 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152FCC061574
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 08:06:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5CF94CE1182
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 16:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0F8C34602;
        Mon, 13 Dec 2021 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639411586;
        bh=+9UCmgjJBnGGefRjpHmzTEuVrzBAvSbvMS1mjhg5Wfc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HAUOE1xmRjgrtikoVmTDIo5SKIukhu/VRTzV9RAlpOSUrjNSpJf78rtLqu+vhsV4r
         BWaVNR4gIhh6IcvIcq1XInDjwGn+q6mrZXoLYyM+RV3UaniYpDj+5awD9kawcj4qMj
         aEiAvSPDZEUtIREieHy7cSfyA4F/50vBPn3mPsZjQhwHpUYhiHXWbgl6pKAw7L5UTA
         +YOkWZHiwCQEsO00WJMvp4M4BQU+2OVd7ABuWKBK2wgzaPLoq2+MuRvBPcZU+8alCl
         xq59G8w27SLhxhGBCvvg/6cWrV5HfCnQsQiysvMmqkoCQ/YzPqtjmZjweNB0e+7Jxi
         r091VK4CCtsfQ==
Date:   Mon, 13 Dec 2021 08:06:25 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
Message-ID: <20211213080625.7febffc2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <877dc8fqui.fsf@toke.dk>
References: <87mtl7ufl3.fsf@toke.dk>
        <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <877dc8fqui.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 13 Dec 2021 16:48:37 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> > Status notification when checks are failing? Hopefully not, we don't
> > want people posting patches just to get them tested... =20
>=20
> Well no, but sometimes a patch will have failures despite the best
> efforts of the submitter (otherwise what's the point of the checks?).
> Right now the only way for me to discover that there's an issue is to go
> look at the patchwork web interface, and I wanted something that better
> suits my workflow (i.e., that's not in a web browser).

I think that the maintainer should notify the submitter about=20
the reason the patch state was changed (with the exception of
patches for a different tree, maybe). I know Kees has been=20
trying to add more meaningful states to patchwork but I can
never guess the meaning of those either :S So no automated
state checker can replace the maintainer's reply.

> I wasn't asking for patchwork to send out automatic notifications
> (yikes!), I just wanted to know if anyone else had done something
> similar before I go play around with the patchwork API myself... :)

Despite the promise of "best effort" I fear such automation.
It's pretty common in (let's call them) modern workflows to
submit PRs / post changes just to get them tested by a CI.
We don't want to give people the impression that the mailing
list can serve this purpose.

Obviously I can't stop you from writing your local code :)=20
just trying to widen the perspective.
