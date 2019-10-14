Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DEDC4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 16:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D4E2217D9
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 16:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="P4Iw/OPo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731020AbfJNQPl (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 12:15:41 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:56552 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730028AbfJNQPl (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 14 Oct 2019 12:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1571069741; bh=wmMU5VDyxK9g/ZUuKoSDvQ7T6no2fYRsXwXF8Bk8xyw=;
        h=Date:Subject:From:To;
        b=P4Iw/OPo94SVoQ+uXVpGZVgOJgHhbQTkmrTQyE4ZVrgUhM/oyqiat3QyAjMSasPZ8
         yobRVyw7AWY0s42xINjRu03tOZEiriKxOdaOA7b07G2naL4yGLby3GJ3UNrNCsNagZ
         XTu6JMS824eSakvDQUcDWQMz23MqIPCH5vnXk4oY=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 14 Oct 2019 12:15:40 -0400
Subject: Emailing patchsets from the web on git.sr.ht
From:   "Drew DeVault" <sir@cmpwn.com>
To:     <workflows@vger.kernel.org>
Message-Id: <BXPDQR3S0Z7D.3UY6YKF3KXSMX@homura>
Update: it works. Here's a video of it in action:
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

https://sr.ht/_fUk.webm

Future improvements will include closer linkage with mailing lists,
suggested recipients, other stuff. Thoughts?
