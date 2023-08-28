Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75392C83F12
	for <workflows@archiver.kernel.org>; Mon, 28 Aug 2023 19:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjH1TXk (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjH1TX1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 28 Aug 2023 15:23:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E94311B;
        Mon, 28 Aug 2023 12:23:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF0CC64FB3;
        Mon, 28 Aug 2023 19:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94DEC433C8;
        Mon, 28 Aug 2023 19:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693250601;
        bh=Zh58FPMDp5iUPGVyJK5INlnRb0PILlv7ubgwPtlRsUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rJoYHIvvAOQ4j9lFJG77TY6kDxCGLgqHfjYda2mziqucqHIUmdL8Yk7D+83TuljpJ
         +/nrYqVQzf4KKGhCLJmy2kF9VJ0g5mZEu5oJIe7KQrM+fdWXgcXbwJP/Wgp5LAOpgb
         Ip46FeiF0Ramc0hwrFxUZMsIUwv1V6knKHem/HLrLDGpu2KUTzCmK5wZpKu9FKim6l
         JuRss2jECe4uvqZRYz5tmtQgSVwHmr54GBjabHxPPL3a9AXJ2wg6rCHQ5SmGDnFNso
         u78v4P/vYDQ20K2vfX6Bb4LLRhp/pBJxxcuEzP8DLr4iiTTXhCJ51g6b6Q+5OwBpMj
         7fJuV97kLW+lw==
Date:   Mon, 28 Aug 2023 12:23:19 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netdev: document patchwork patch states
Message-ID: <20230828122319.6ba6c400@kernel.org>
In-Reply-To: <20230828190911.GR14596@pendragon.ideasonboard.com>
References: <20230828184447.2142383-1-kuba@kernel.org>
        <20230828190911.GR14596@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 28 Aug 2023 22:09:11 +0300 Laurent Pinchart wrote:
> > +New, Under review  pending review, patch is in the maintainer=E2=80=99=
s queue for review =20
>=20
> Is there a meaningful distinction between "New" and "Under review", or
> are they exactly the same ? The former sounds like nobody has looked at
> the patch yet, while the latter seems to indicate someone has assigned
> the task of reviewing the patch to themselves, but maybe netdev uses
> those two states differently ?

The honest answer is that I don't know. I used to think that the
distinction is as you described - after someone done the initial triage
on the patch it goes New -> Under review.

But there's little consistency with that happening and it's unclear what
"initial triage" constitutes at this stage, so for all practical
purposes New =3D=3D Under review.

> > +Accepted           patch was applied to the appropriate networking tre=
e, this is
> > +                   usually set automatically by the pw-bot
> > +Needs ACK          waiting for an ack from an area maintainer or testi=
ng =20
>=20
> How does this differ from "Under review" ?

This indicates that netdev maintainers are waiting for someone who
is not a netdev maintainer. Let me s/maintainer/expert/ to make that
clearer-ish.
