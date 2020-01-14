Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912F1C33CB1
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 150542187F
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="oIcIgCaH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgANNor (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 08:44:47 -0500
Received: from mail.cmpwn.com ([45.56.77.53]:55796 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728877AbgANNoq (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 14 Jan 2020 08:44:46 -0500
X-Greylist: delayed 558 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jan 2020 08:44:46 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1579008927; bh=ddU8MX8TMSw2h06swnDv9ZQSw/lEen7YVQTomH86A9k=;
        h=In-Reply-To:Date:Subject:From:To;
        b=oIcIgCaH027Wwzi0Z5vEuFEZ5w6xMZ3UkZAiBsQWi396Z6arbuLGPg63AYh+7ExT8
         Ka10EWttTdzSFWZyBwIAxP0hdz3sSrc/FS8ptjHmYkQ5RnI+Si/dPG7NxF4uh7BUwn
         02zWhV2KUL90FelNeQGc+11GQSI9Hxb3g3zO1XPQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <87d0bmkx1w.fsf@linux.ibm.com>
Date:   Tue, 14 Jan 2020 08:35:14 -0500
Subject: Re: matrix.org as a replacement for IRC?
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        <workflows@vger.kernel.org>
Message-Id: <BZVJY1FGBLDC.1FI35DM2QXOZT@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hard NACK from me.
