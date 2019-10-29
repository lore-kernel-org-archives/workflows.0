Return-Path: <SRS0=oU80=YW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3678ACA9EAE
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 15:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0FBE20679
	for <workflows@archiver.kernel.org>; Tue, 29 Oct 2019 15:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T83k8QXF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390129AbfJ2Plw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 29 Oct 2019 11:41:52 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:45967 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390115AbfJ2Plw (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 29 Oct 2019 11:41:52 -0400
Received: by mail-vs1-f51.google.com with SMTP id l5so9011891vsh.12
        for <workflows@vger.kernel.org>; Tue, 29 Oct 2019 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6dI9RO/nJzHYMkvGqbM/Secn9stUv7Dtik0Zxa8Aq44=;
        b=T83k8QXF9X70DkQgG6Yj2fIMnUecAVQSQAlTbkuRmNPB6ewvmpcq80YSWA2Gy2Avv+
         T5/47IqSgPIC87+rYrfOqLtbNzxkMOSHsMR+5i1v5DwVZdyW1dBWpp4ZNvl8lfWxofz8
         nDk0T6V2IxVzPg9cyFJpaDLolhz9H8upuMjd6p8mNJ0ypUpqiDRi1Aa3bgFLc1h9R/C8
         XkXN9YcLJk4RAGZj/ktIVH2kU3LCnMztbFzy5S7R+XNCaAXdYfZZqXrkLSEO1MmTuT6b
         au6xxg0Jvlb878dKAalraCvlA4efV5YBZuhCxlWFxZ8Rx5agobxNM1QPV+RbKwGjT+gf
         ycLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=6dI9RO/nJzHYMkvGqbM/Secn9stUv7Dtik0Zxa8Aq44=;
        b=adLoJbvRTll1eg7QGhV7//YZw2IMQlEkHnC4efpDFnzvMcS3GN/zQAxSaEUVRanc9h
         Ka9teUpUkOAoD7rjonZi9xQZB7oZqbPWsQ07wkX/IrlIB3vJVX2UtjVEGMoR8wXe/I95
         kfP6KBFZnrBVHTGWU+ITg+IWytKHEBh3lbvR64Ix5MqMCiinFAE3H6pckx2DDoXcq47l
         N0pFiHUYa5/i7bnwsCcPoMWjj9q9jVA6AxkmyJEpdy5ouVsMsnMQSKc99VShKOHM07CM
         xMH/9nj/bx9h8BO4KmJsrAOtWGVwKU3dObHa1C41PXiNCpiI02D9CW9pcL8XNk8SUoSB
         M2HQ==
X-Gm-Message-State: APjAAAVIkMOPNZgRGBPtciXMWUYG5wgroNf7kycnCBDFqS8VJNBJPhN7
        9aFXlZcpyMaj6yZCQcPRgtelEd+OM3RxNilJmrIiMS5TMbmR4A==
X-Google-Smtp-Source: APXvYqwwnDe7oTSnOZig0UpTpJLVfpP+1FTnsdycRWQg/HxWLeBDKI2zbmJ0kNMdU7S8z+huyV5S+mGauOuYxZ3RnRc=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr2283327vsc.204.1572363709829;
 Tue, 29 Oct 2019 08:41:49 -0700 (PDT)
MIME-Version: 1.0
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Tue, 29 Oct 2019 16:41:37 +0100
Message-ID: <CAFQ2z_PiNzDeBT7mnprRdk2kf==HoBU1HM7NT4hgFns1wt4WVg@mail.gmail.com>
Subject: Lyon meeting notes
To:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi folks,

I tried to take some notes at the session today. They're a bit rough,
but I hope they'll be useful to someone.

https://docs.google.com/document/d/1khLOBw5-HyaaNX7xregpHQLSfvGDUeHDY921bkI=
-_os/edit?usp=3Dsharing

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich

Registergericht und -nummer: Hamburg, HRB 86891

Sitz der Gesellschaft: Hamburg

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
