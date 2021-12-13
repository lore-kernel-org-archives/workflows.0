Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EAFC433F5
	for <workflows@archiver.kernel.org>; Mon, 13 Dec 2021 15:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238999AbhLMPIs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 13 Dec 2021 10:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234998AbhLMPIo (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 13 Dec 2021 10:08:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D43C061574
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 07:08:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 011F5B810AD
        for <workflows@vger.kernel.org>; Mon, 13 Dec 2021 15:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5CEC34602;
        Mon, 13 Dec 2021 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639408121;
        bh=2s1+pO/pxeXH+3r63ypX6fLQWK2GlhTqUKhFK/jMXuA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oqX9JWLjx0f2kbp+TD46/vCspiBtgY9hDjIZBTRSYvqW6CuDi3bGN8xKkD9PVCkLJ
         Sa6AIDBA+ezuAzJbsnmcVaMs5BWJzXkjM4BFZf0xX9GkTDXlpwaBYv/N//ps6DEQhR
         JLCrGuwFBOLsJFV8YeVb7IeV4buVVvPQoO6fRGJDGeqqQ4xTGzoBFiMl8pc/aR7kOH
         XxRDgG3A2hnqIePjvexzdpLEcZOJ0DdhnQ+3vPdF5XdPR77OnEBDSiGpv1zyHH8LCb
         ubyrP8PwMCZs1/vMdRUdZvfhLRBBF4yk8vlhO51s2sIqQmRdjyk5GvU6O4r4r+L8dI
         u9EETCqhbkFiQ==
Date:   Mon, 13 Dec 2021 07:08:40 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Monitoring the status of your own patches on patchwork?
Message-ID: <20211213070840.4353fd6d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <87mtl7ufl3.fsf@toke.dk>
References: <87mtl7ufl3.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 11 Dec 2021 20:06:00 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> Hi everyone!
>=20
> I was wondering if anyone had any nifty tricks or utilities to help
> monitor the status of your own patch submissions on a patchwork
> instance? Things like getting a notification when a patch changes status
> or when one of the automated checks on that particular patchwork
> instance fails for a patch you submitted?

Status notification when checks are failing? Hopefully not, we don't
want people posting patches just to get them tested...

> I can just filter the patchwork web interface to my name, of course, but
> I would like something that can be automated so I can make the stuff I
> care about show up in my inbox :)
>=20
> Many thanks in advance!
