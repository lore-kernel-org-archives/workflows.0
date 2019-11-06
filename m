Return-Path: <SRS0=q5JR=Y6=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C18C5DF63
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 20:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B577B217D7
	for <workflows@archiver.kernel.org>; Wed,  6 Nov 2019 20:31:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=spwhitton.name header.i=@spwhitton.name header.b="itjJVmqi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="seXVUC4F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfKFUbF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 6 Nov 2019 15:31:05 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43527 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727587AbfKFUbF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 6 Nov 2019 15:31:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 3B5C04AF;
        Wed,  6 Nov 2019 15:31:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 06 Nov 2019 15:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spwhitton.name;
         h=from:to:cc:subject:in-reply-to:references:date:message-id
        :mime-version:content-type; s=fm1; bh=eMCTDES71WJgbOnUBKSP2E4pYF
        DSRNq13FfAiAnJuAU=; b=itjJVmqi+1sZt4xF0xWDgnkL0VqC8/AklUck6el51x
        Tn2qKkm1ein6+5l6nWRiVKVXYINvo3SpvgXRPaCWvoBxGrny3KnwEpJm7y029lV9
        9r0GmC/13htk/Y+e70cj0QdXtcqlIcR/MB9nc6XMJC5JwMDRXV5ol2kf/JyRTnbU
        IpoefPfHxOwkc0sbMhRNZGilD64v/TJGct6B+b2Urx7LkhcaZ3EO3yowgdMnbger
        8TnE/YGdgowObVpnuo4XaXT+Jap0n1kPXFIoq5xs10DhIa8gtz6o3E5PYXX3fH02
        K+cQVWKra1z2j1dELaZIlI3TUaGiOiqQxj1/PTCUIVqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eMCTDE
        S71WJgbOnUBKSP2E4pYFDSRNq13FfAiAnJuAU=; b=seXVUC4F07lMUnxF9ZNlcH
        +AJG8OSWnqTDNyCGM3Nda/i1GJ4x5p6eJ3L9FH8xP4+PM6ol4TkcBmSbU6Q1Thtq
        IMSQRd4h0o7AITECAQlOMBzBmyDSPwK32sm2yXLtS1br8AFysp4O+mi9rxtO8Cwc
        ROmhNdwjPW2QdSYAjfrNmlNV0u2HJViZZVnPesqQRJEqjAq1Orv6AeQ5tCXq9yXf
        sxiXYNgHYijDax0ODK4V6dS8sSx4fg/3tD3hbC/5nILTbeeCqFj+ErLE0zj5J8S+
        m5hDKWo7XninAOvHR0aH+SqOt/MshRNKNmKXecHXu67ZY04rEhnie97HqkrpWE0A
        ==
X-ME-Sender: <xms:hy3DXVgdXUCOou_TryrVdaPWRGr55_yX9Ta3aTYzCFPlOEZZI2PRMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffujghffffkgggtsehttdertddttddtnecuhfhrohhmpefuvggrnhcu
    hghhihhtthhonhcuoehsphifhhhithhtohhnsehsphifhhhithhtohhnrdhnrghmvgeqne
    cuffhomhgrihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomhep
    shhpfihhihhtthhonhesshhpfihhihhtthhonhdrnhgrmhgvnecuvehluhhsthgvrhfuih
    iivgeptd
X-ME-Proxy: <xmx:hy3DXc8WC4mPeFJGB_fG_WtLIV4rrdjhvqy5BaxMX_jXaTmmniUumw>
    <xmx:hy3DXb3hKUwkwSk66MkSzkmANHrZaWdC1eVnq8brF6D_9SzVJnqtrg>
    <xmx:hy3DXUZou_5eOd7qVqCi4xeR0FkG0-4GkqTrGx265nU0-VqKtfWz5g>
    <xmx:hy3DXU70nEc1dz7vmOWUNrUFqpSg4WRU2vLUrkGSFUkOrsJMxEv23A>
From:   Sean Whitton <spwhitton@spwhitton.name>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Structured feeds
In-Reply-To: <CAFQ2z_O+_T8QZOHfr4YjpSJ7Qo=GvHq0RE1Hvq8LiL7dimNWkA@mail.gmail.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <CAFQ2z_O+_T8QZOHfr4YjpSJ7Qo=GvHq0RE1Hvq8LiL7dimNWkA@mail.gmail.com>
Date:   Wed, 06 Nov 2019 13:31:02 -0700
Message-ID: <87sgn0zr09.fsf@iris.silentflame.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello,

On Wed 06 Nov 2019 at 08:54PM +01, Han-Wen Nienhuys wrote:

> On Tue, Nov 5, 2019 at 11:02 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>>
>> Eventually git-lfs (https://git-lfs.github.com) may be used to embed
>>
>> blob's right into feeds. This would allow users to fetch only the
>> blobs they are interested in. But this does not need to happen from
>> day one.
>
> I would avoid building something around git-lfs. The git upstream
> project is actively working on providing something that is less hacky
> and more reproducible.

Could you share a link to this please?

(There is also git-annex.)

-- 
Sean Whitton
