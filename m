Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40ABE7E62A
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 04:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjI0EPK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjI0ENu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 00:13:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652841F0A
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:30:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9adca291f99so1243603066b.2
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695785448; x=1696390248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nppwpKZq5iygodJXecx1lmUaP9gsbzRp9mrEGrUyrgo=;
        b=f6Y8HXG/UOya3f+0mHrnRJL1MQst79zz4deYzoeSon9VdSJZhhA98YlMIjXNms0cNS
         GniNRB/N9ff7jwVTf5GAxmL6yuvlSiYENpGYLE3+NI2K2fraW0iShGW5pa0s9onLpEPW
         0F5jPGwh+gCzN6BVzR203vNBPXwqGdqOEIrnHYLnYmCNIylBk6o9pCVt9bQNfrIA9nAd
         73HpANIqJA6rD4FHepam1Kp6RpQWrqRz3j3Wqgnt3tn+snme6ozuHBGiMxeE0zZN1N2P
         YOh5hgPci24Bw5n/fQUACzXQEYL0KSuEyBq2s06w9/xV5VDvhMrXAMHW+vs6TjSK/I9c
         0wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695785448; x=1696390248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nppwpKZq5iygodJXecx1lmUaP9gsbzRp9mrEGrUyrgo=;
        b=J4mpZM6PzshQ7G4NEOMHvsl3O7ci+BR50YL+Eo4zlncD0QHR+/vaHayrMo0ou2u0Su
         4yBq9qYO0Cqk4XzdCTCLGSUkqwXl9Ras0xVO+7m6r1YgJ9Eh2D0/Jg7yGho7uvHldxeE
         7pqbUMDhqZS+eTuHcVUaF8Y72n4j0Gx8AqoeSw6+dps3SPrfs2tiMOU3mKDUrI9+ycBD
         lKSMk9nA4KTUrO34sHhBU1FzHcFfpFU3H/4sGXcHoJ0iyZ8aTrPv/qob6g+LWZKmqDco
         4XB5AfpmnlFJrqo4OlghX0AWXMQyD5K0niURvnI3ACwpl+9kbVNsrQwsqN2cb41qkzTN
         FVVA==
X-Gm-Message-State: AOJu0YwT+764wasZRW/ptSNlFRCg/N4Z7pBg3dBgG/M44UJQo6u7gbR2
        8rue2yigyFbP/DVOKT2O6Sd/IDE3j1BpbKE0pP9tWQ==
X-Google-Smtp-Source: AGHT+IFcLyVzIzw4hV1jVAVdCCoXngVbCS/riNKQfab68M9OsvyIzENEy8FHbfDNBD9x0wBTx4G3x3FIQ76RlFOqVnk=
X-Received: by 2002:a17:906:70d6:b0:9ae:961a:de81 with SMTP id
 g22-20020a17090670d600b009ae961ade81mr557499ejk.27.1695785447817; Tue, 26 Sep
 2023 20:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com> <036869e27fbc0ec753afb4e5ae32fa74ada8e24f.camel@perches.com>
In-Reply-To: <036869e27fbc0ec753afb4e5ae32fa74ada8e24f.camel@perches.com>
From:   Justin Stitt <justinstitt@google.com>
Date:   Wed, 27 Sep 2023 12:30:36 +0900
Message-ID: <CAFhGd8q+cbqi3v=tyVKYVHEUTymc9HhRBSN4M1UFgVn7F29aqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: add documentation for D:
To:     Joe Perches <joe@perches.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 12:27=E2=80=AFPM Joe Perches <joe@perches.com> wrot=
e:
>
> On Wed, 2023-09-27 at 03:19 +0000, Justin Stitt wrote:
> > Document what "D:" does.
> >
> > This is more or less the same as what "K:" does but only works for patc=
h
> > files.
>
> Nack.  I'd rather just add a !$file test to K: patterns.

Are there no legitimate use cases for K:'s current behavior to warrant
keeping it around?

>
