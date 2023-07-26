Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9823DC001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 05:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjGZF4j (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 01:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjGZF4i (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 01:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F9C1989
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690350952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BoO6p8OipFbIVRp/vUM7Zcf5r2fw8A+sOpUnPYaEJPY=;
        b=QfBCgUisSAw1x28Fj7iy/1SoL0N7LX5/d3t2S2duFCVs28W/mE2C8AteaNP1OYh6aGnauz
        cFQ5Bt9XqXwRPjeJ38E4knRiWpLfWOnEb9VOwLD8Yy9EPpeDvnzy7K2jlj15aWCjd/DluI
        W84tZObKYQTrqdZ2MrP1PdAIvte4jd0=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-32o3Yc7ENB2LNYNdrgkwfw-1; Wed, 26 Jul 2023 01:55:50 -0400
X-MC-Unique: 32o3Yc7ENB2LNYNdrgkwfw-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b9c03dd4f6so11748140a34.0
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 22:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690350950; x=1690955750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoO6p8OipFbIVRp/vUM7Zcf5r2fw8A+sOpUnPYaEJPY=;
        b=YwogkgUiCBdUD+q1e0OwcxoXoQt4sYftJEvdJ/LTyoyEwamOPiznGjtptV9Sv8QaRm
         VmkUb5NWhV5wZ/VjDlQUfFw/iel0gIxLKE80rd3ynmip10vLABWeVqHd1gvTZyUq0umv
         ylxsAccmwEQaS0BwyVP/I3eAQ5987qcqLy17fCqjlA99/qNQ3MSig5FIb3SJbPC33QfG
         BXwY5xby4GK50MCBFo2EHU9s9jWemxTJTZKC6xYUjIcTgYUXSEYD9R1cBcWdKyctk4Nl
         ahHxPyaY4Y7Tuxy9Rnb/FEsiQfU6wEWrvZuw//cD5xAXLI6hzo17vOFX9JhwTmfzCv7C
         y38g==
X-Gm-Message-State: ABy/qLbuCrP4G7q902hYoyKy/MTtjgnMlPyM3IV/v+ZUFUmoFx+9kc8H
        HTtu929v+SqWGzU0LjuLGAePGctdLYO3xpJfDPA2yXOwj9bYGP+pe46CO2TpYrl8sqlXvXM2ZNw
        kK4UdC+ceZzS4+zWW1qPCk6Pj8E0Ty8Yuv4TXoC6Ltfj4hFw=
X-Received: by 2002:a05:6871:806:b0:1b0:2ded:bd7 with SMTP id q6-20020a056871080600b001b02ded0bd7mr1353706oap.26.1690350949963;
        Tue, 25 Jul 2023 22:55:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMDM0FaPwcSQf/RqvNSpjmA0qJJtEYdpnUKfPyPzpzqjFUhCmFN8imrQA3L7qRhB+SgUcXRspcP18bjzS8d/o=
X-Received: by 2002:a05:6871:806:b0:1b0:2ded:bd7 with SMTP id
 q6-20020a056871080600b001b02ded0bd7mr1353696oap.26.1690350949784; Tue, 25 Jul
 2023 22:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230724193118.2204673-1-costa.shul@redhat.com> <87ila9atuk.fsf@meer.lwn.net>
In-Reply-To: <87ila9atuk.fsf@meer.lwn.net>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Wed, 26 Jul 2023 08:55:38 +0300
Message-ID: <CADDUTFzKCrrBT=46F-08_EGrwMxVniDOgdkVr-DhGFTzS3DxOg@mail.gmail.com>
Subject: Re: [RFC PATCH] rework top page and organize toc on the sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> This patch is somewhat difficult to apply, as a result of:
> > Content-Type: text/plain; charset=3Dtrue

This is caused by em dash in the context line:
The following manuals are written for *users* of the kernel =E2=80=94 those=
 who are

I haven't found how to fix it. Are there any tips?

