Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965F6A32
	for <workflows@vger.kernel.org>; Fri, 15 Nov 2024 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654170; cv=none; b=hVClMv/xAyyCpiN8UYpZmYbU/IFM8Q2u1ilvfx7ND1qYpBDodFuKJJ6YawcGsNV5WilGjKp+su11aQz3if0iQyiZ6bAnYIXNERzUKAcmGIHOIAyK6sO8ciA/4U1jk7l0Cz+fIj6fj3UkRxafxclCfN0rQcw8oicZSDyS7WbDSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654170; c=relaxed/simple;
	bh=ucRdI4zZiJOb3gsW2929kn/SeFGdDlj7BOd7CP512xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJVwVXqvmCHd4X9Z/xGvpCrhKZKS/v6u2Ym55p8YIiPUWR1HDi538d8hFglvuPrIvSai8jr5t9WuTow4iB72/3o83HypOXEBTlLyzxszKMeTEVoRZuK/JMftEmkHUoys18OR9GEpgVH+saRpelY2y4qDpvms10vYFe83boPuJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geka36FB; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geka36FB"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4608dddaa35so213151cf.0
        for <workflows@vger.kernel.org>; Thu, 14 Nov 2024 23:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731654167; x=1732258967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdhHbTzTKc3SMetmKy+wNf6PkpzJgq0XFpQInOkKr7k=;
        b=geka36FBVdjkQkOTpftKAenFdiw65FRCEsmWPdlmgqzGFvGcZ3yTBRMc9gw9svZwNo
         b6PNE1yrjYVvBLCWxtsCMoeOU8+elTiQGsKAgcYWQZpxJKjURXqZMJJNSfsbr/3dHaPl
         JK6nNLjHwlXhy91w0FVMfeTgsWO13E6EneYqWb260asFykoKZwuBehhBNpH1fp03cOuE
         8b95l5KjIQe2XMQ2BFF1MgViYDuLzhDCYs2uGfD10OIEqOlm5LOlbJGn7EKuBIWODMGd
         Q11AI5VtqisqiKCVBzvoIKH3yEyHORahexlYPwdYI5YpGdAn+W6cslhVPQw3o5NYsV8N
         nkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654167; x=1732258967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdhHbTzTKc3SMetmKy+wNf6PkpzJgq0XFpQInOkKr7k=;
        b=f7lqNFq7l/zmjDV5PWb3tVutc7QdWq0LiJMUwyrU3Q0ffCuMA4wK9tvEVd1/nAk3+d
         aRePcPbY++5o4ssokmYdZ3AwtcVYN/z0Oaw5KBhUV9esHMlvopHt8f+dk3QxA6urZLH1
         3JTpWI4yMnTbiJfDZ6ieNJOKmCmBXkUCMdbGr42LLNiUbWfStFJML2BoI35t2SDaAvSj
         pKT6vhGEQce+elhWVYsS3S/CagFuGgkjtX4sUA90RXKDpfNKQyD9eW0nMsivNRUzINH1
         CzWqoKVZg4ygaoqq79hNKwho/NU8LyuEcFw7r5lbBTBv1w/z5yoxyTY13E6aAgOZMGdv
         Pn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhfZLlcT30SY1yE6C/IyFbDNCpvEULRbrOUfB9nYnqB+xIqS62azK5EtWGsFmtiX55VczN4ZNDzc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycoiPDb1Z9tUz6r+lBYdq3ZjWtnWl8w4Ng+xOQdX9WXBjpXJiq
	u6MtIJS5IuYpHu3mY9IRe438JBa0B98MV+xBzWg7/ehllaMtikXxII6bv48PkipMZaPf3QI1Adh
	wZ+qjniN4Ycxc+inVvyrtsZOJy6F3FQr9+igMq8UUtVwjljgApH7AObw=
X-Gm-Gg: ASbGncsn1aHUrU4eENdv1qLbcPIxUJIbLbGynThlGRxyVNFrLOzyTLvQTA1xLaVkrAk
	86OEo4SNKHpmDjNWmiwa5s72yVyyPhw==
X-Google-Smtp-Source: AGHT+IEZQumBx9rAByuSeR05qYBdTIlqZ++eXdNrS2altRO43l1pCrcUxa66OFIF831o8TKPmzacL49GHPpAP9FS1l8=
X-Received: by 2002:a05:622a:47ce:b0:461:32e9:c5f1 with SMTP id
 d75a77b69052e-463637282c0mr2202191cf.10.1731654167227; Thu, 14 Nov 2024
 23:02:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115051107.3374417-1-yabinc@google.com>
In-Reply-To: <20241115051107.3374417-1-yabinc@google.com>
From: Rong Xu <xur@google.com>
Date: Thu, 14 Nov 2024 23:02:35 -0800
Message-ID: <CAF1bQ=R=481iZu1Zp8p42zvGd_oLrU-K9UHtSe9TbZUDkS8Qkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Yabin Cui <yabinc@google.com>
Cc: Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yabin,

Thanks for working to enable this on ARM64 and test the performance on Andr=
oid!
Please see my comments below.

Thanks,

-Rong

On Thu, Nov 14, 2024 at 9:11=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> selected.
>
> On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> Experiments on Android show 4% improvement in cold app startup time
> and 13% improvement in binder benchmarks.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
>  arch/arm64/Kconfig                  |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tool=
s/autofdo.rst
> index 1f0a451e9ccd..f0952e3e8490 100644
> --- a/Documentation/dev-tools/autofdo.rst
> +++ b/Documentation/dev-tools/autofdo.rst
> @@ -55,7 +55,7 @@ process consists of the following steps:
>     workload to gather execution frequency data. This data is
>     collected using hardware sampling, via perf. AutoFDO is most
>     effective on platforms supporting advanced PMU features like
> -   LBR on Intel machines.
> +   LBR on Intel machines, ETM traces on ARM machines.
>
>  #. AutoFDO profile generation: Perf output file is converted to
>     the AutoFDO profile via offline tools.
> @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
>
>        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a =
-N -b -c <count> -o <perf_file> -- <loadtest>
>
> +   - For ARM platforms:

The instructions for SPE might be different. Can we change to "- For
ARM platforms with ETM trace:"

> +
> +     Follow the instructions in the `Linaro OpenCSD document
> +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fd=
o/autofdo.md`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <load=
test>
> +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di500009=
il
> +
> +     For ARM platforms running Android, follow the instructions in the
> +     `Android simpleperf document
> +     <https://android.googlesource.com/platform/system/extras/+/main/sim=
pleperf/doc/collect_etm_data_for_autofdo.md>`_
> +     to record ETM traces for AutoFDO::

The instructions in "Step 3: Convert ETM data to AutoFDO profile"
currently use create_llvm_prof to generate
 a "binary" profile format. This is incompatible with the default
FSAFDO format used for the kernel, which
 requires an "extbinary" format.

To correct this, please update the instructions to include the flag
"-format extbinary" in the
create_llvm_prof command.

Using a non-FSAFDO profile with FSAFDO can negatively impact performance.
Therefore, I recommend rerunning the test with the updated flag to
potentially achieve better results.

> +
> +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> +
>  4) (Optional) Download the raw perf file to the host machine.
>
>  5) To generate an AutoFDO profile, two offline tools are available:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..c3814df5e391 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -103,6 +103,7 @@ config ARM64
>         select ARCH_SUPPORTS_PER_VMA_LOCK
>         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>         select ARCH_SUPPORTS_RT
> +       select ARCH_SUPPORTS_AUTOFDO_CLANG
>         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>         select ARCH_WANT_DEFAULT_BPF_JIT
> --
> 2.47.0.338.g60cca15819-goog
>
