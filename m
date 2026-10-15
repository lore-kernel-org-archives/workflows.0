Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AB53CF685
	for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074880; cv=pass; b=KXFI5p7OPl6KDtBZeO0CT10qayLUUgnZHmPWB57WGEW5KHcxIFUE/EIN9DDIPQk1ixg0Bs2o6eWzYmK/dKmNkZVsnkeOlf0XeYywdGjIZ8Dvanw9aZQEF5ZtD4taV1qYUdgnHZ3voG91uVVXudniJIj2tBY4G3CjpU41S3FjlkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074880; c=relaxed/simple;
	bh=0qgS0UO1kcmwhXpK5KzPjRFjdmmHM4Qfpm9Hq9l0y94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fw3RNnWnZ4arJ5oS/0dC9IuwzJF4MybFbLBGAJayoExwim59mC5yTXIo0poj2jxiKDvlLbMSLZ1G/EAieqohrzYxUbvbMETGGvGPk1I7XA7vrycrV2L3YIHnmsjEqHd2MtveyMmIUXMDR4ZE1zkzJapxavK9M1JuicIR47txMg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kki8MEN0; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kki8MEN0"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1419d3416ceso3906551c88.0
        for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 07:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792074878; cv=none;
        d=google.com; s=arc-20260327;
        b=Sms5KnovsW9/eNoW3xXLF31uGQCz7jgclHcTMvdVfO2wMWKqr1oEBjWUnn+ho9D4Ua
         +5hwdM9E9JCzAttL6ZKT/XfkChv3pVDzPnh6k8p/RceBFFwXzjKc8GH/epb8MBzWUkFy
         zd7Lu6pgRWIjftJE9mkiEPpQrIaejAovZ/i9fOdeZw2CvnT0n9RrDV74lsmUfTmG0jPE
         pSZ55gCBpyW1KJidD1O99Og/DV0sBMKv5dfE+Bi1scVBBYawm9F55qhPOmA440Ox2A/F
         iO3Cnk3SGA1J7oSjvUG1lJNkWv430e66+DH8LiO98BRJQvVWebVRpy/4btzIc5qlFRNE
         pJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        fh=ZGl/y3gdWO4i3bhoMuAKF5ustU8tvxyvmnePR+STpuc=;
        b=FnT0TwmYAfUvpwbHHQYU2rpcDlQY21+EJMUFHqf05LYbJ4Shshynq3InxgAhxph65Y
         AIvZTr6F8OAdpiWmMAm63VLQnuP4KxXCdyIlT+vLaK5KnsA96vru2owOrG982elxiN4w
         ILDvHpbJjQUfUzRFHqn1PBSYkfXO1QiBZ3BF1lInZ95I+sotvQfyb//rFgpJjoypsfgZ
         DxsiZooquDWcfyDNejg548aspkWEVPNs2h+tPjehru5f5/rjPnV59W54aS8gAH1O7f4U
         cMjH4vb+5JDji7otWh9nFWNyaCAxR4jlIzucRa59WHS4kAYTGjPOU+WKVin8pN/skyPs
         V3Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792074878; x=1792679678; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=kki8MEN0wBYVFMQ8UYnW98K2Dw2BWXb7ywQ5r4U52c8SxrqSD4GLs6jK36hIL/yPhf
         VQv9DByVceIfDj2e38oZb4Ty1pgKl67+lYphxGv17/+RsZ4t8NBepAUIyYQCoMcAym73
         /UQkSrKSNRXkMvYy6fimKS92tE1a4Z4FB/SmHW5RtMFkKK0FN1+Pk0eTStblfoICPOYz
         uNtIvhgBSYwwBJBAWT/q6TXSbwfJn206YT7BzLLUoyjlMsnBC7E/Ytb3BwvdRjPvSZOU
         BsDAgYWOGkTMcZ3wDO6TrZ1SbdO0C3TTbEgyphuLiPaCDqYyRfexhi7GxJ5MFlWEQQ8p
         ZIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074878; x=1792679678;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6fmcBNM8ahIowcwsWLF3jcUhFNGW6deuYFquaOGjh4=;
        b=AZ1zF8T2klIT+hEztxrEOO97VrxZNfN54eUEKGMBSX1is5rHN1tNj0o2QDk9Ht/3Sp
         eUFGFVhp3ekKzG5FN59WXE6KACxfTJHcnHZxc99BJ8Z8gp3BFCtH0snkelobtFifByX5
         YvTQ0vlMFF0BZvklwv1293Ml4eq4jb3x/kLAKRw5cMFKciQ40xfddPSpzA4YZjeNu74r
         3nZwicgyHLYjcGnII/cgo9AjfNv+xcKcMDBWWILb/lpT8qfWGKlEjgF6ABZJoQDwIsKF
         RxaKLtRRjwPDX+WK7nmQErZe2TRfstfysJo7rlDS7+7uXD/qLYizXE6fNQuznesSKArD
         kNJg==
X-Forwarded-Encrypted: i=1; AKwUvBw5WPr9aKysR32bSIDUR6pOel6ci2iifFv/hS+dLLYVRbXTKbAEYJHiz23q3ykOpWT/HREztA7YB/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRRDwUrE3cyFxWMHpLvi/qk9J4r577IzA97zArC7DGasPunkb9
	nJsRsTm9rPEu1mnpw+CE9N0+1fa8yv0bWwSea34PlFN/CpTZPQ4ovotXwQf51Klzq2FisT+UeMp
	e/ChB1xP9mJ7CV5Ymdtw9S1u6v5TlHK/FztZgUrW8
X-Gm-Gg: AYBFou1PYSQo4f52mHk2p4oZsIlUmvhVakZw+9gxeGDrudZkuV/M5ebcMrSkdjimpqe
	FHfpHTJIPqd7KO1UsxNZPZI788ZlZUXy+OdcHBrGtWBlAxnrxWr59yFh5Rs0tbzSTw+0cEx9CAy
	ndcDDYawNKSzQNKfQMTC6txENlnVE+jFRTY1JyClQbDfp38YZbHt5M6kOclLlDZWxGWmqNJf8JE
	1VDE11GfotOG4G9L+Y4sf9ywdLq4iUZUWKcRwVYaZhEK3V6waGgy9lde9LsAOnHx5FC7TEzhtT0
	9RSPTarXJAS9ksl64ZDq6TCtBMro+04Pe87cw0Gdx/NFO939wm74dD/+cxnhY0SBBufpQUpJwx0
	hKkaq4zh9sw==
X-Received: by 2002:a05:7023:908:b0:14d:f83b:f678 with SMTP id
 a92af1059eb24-16a63093432mr28786311c88.43.1792074876931; Thu, 15 Oct 2026
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014095238.2132580-2-sh_def@163.com>
In-Reply-To: <20261014095238.2132580-2-sh_def@163.com>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Oct 2026 16:33:59 +0200
X-Gm-Features: AclHuK_nqb0XohDsRgRoJxANfSfWrIowniz6RXwKCNJicgsayXH681Q_GDC1JBM
Message-ID: <CANpmjNN0_EX8Tug6UFp=sap_Zv3QH1PnEn4GPGSKSHEU72W6zg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] kcsan: add targeted watchpoint matching
To: Hui Su <sh_def@163.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 11:52, Hui Su <sh_def@163.com> wrote:
>
> Add target state and a static key to KCSAN. When a target is set, only
> non-atomic instrumented accesses containing that address are eligible for
> watchpoint setup. Other accesses do not consume the skip interval. Keep
> report filtering independent from target matching.
>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>  kernel/kcsan/core.c  | 37 +++++++++++++++++++++++++++++++++++++
>  kernel/kcsan/kcsan.h | 10 ++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index 2db82661cd60..2a58a3a53adb 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -12,10 +12,12 @@
>  #include <linux/delay.h>
>  #include <linux/export.h>
>  #include <linux/init.h>
> +#include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/minmax.h>
>  #include <linux/moduleparam.h>
> +#include <linux/mutex.h>
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/sched.h>
> @@ -108,9 +110,40 @@ static atomic_long_t watchpoints[CONFIG_KCSAN_NUM_WATCHPOINTS + NUM_SLOTS-1];
>   */
>  static DEFINE_PER_CPU(long, kcsan_skip);
>
> +static DEFINE_STATIC_KEY_FALSE(kcsan_target_key);
> +static DEFINE_MUTEX(kcsan_target_lock);
> +static unsigned long kcsan_target_addr;
> +
>  /* For kcsan_prandom_u32_max(). */
>  static DEFINE_PER_CPU(u32, kcsan_rand_state);
>
> +void kcsan_target_set(unsigned long addr)
> +{
> +       unsigned long old;
> +
> +       mutex_lock(&kcsan_target_lock);
> +       old = READ_ONCE(kcsan_target_addr);
> +
> +       if (!old && addr) {
> +               /* Publish the address before enabling the fast-path branch. */
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +               static_branch_enable(&kcsan_target_key);
> +       } else if (old && !addr) {
> +               /* Disable the fast-path branch before invalidating the target. */
> +               static_branch_disable(&kcsan_target_key);
> +               WRITE_ONCE(kcsan_target_addr, 0);
> +       } else if (old && addr) {
> +               WRITE_ONCE(kcsan_target_addr, addr);
> +       }
> +
> +       mutex_unlock(&kcsan_target_lock);
> +}
> +
> +unsigned long kcsan_target_get(void)
> +{
> +       return READ_ONCE(kcsan_target_addr);
> +}
> +
>  static __always_inline atomic_long_t *find_watchpoint(unsigned long addr,
>                                                       size_t size,
>                                                       bool expect_write,
> @@ -277,6 +310,10 @@ should_watch(struct kcsan_ctx *ctx, const volatile void *ptr, size_t size, int t
>         if (is_atomic(ctx, ptr, size, type))
>                 return false;
>
> +       if (static_branch_unlikely(&kcsan_target_key))
> +               return kcsan_target_matches(READ_ONCE(kcsan_target_addr),
> +                                           (unsigned long)ptr, size);
> +

How does this change the generate asm (say on x86-64) of the fast
path? (E.g. take a look at __tsan_read8 disasm.)

We tried hard to e.g. avoid stack spills in the fast path, and if that
affects fast path codegen negatively, that'd be not so nice.

>         if (this_cpu_dec_return(kcsan_skip) >= 0)
>                 return false;
>
> diff --git a/kernel/kcsan/kcsan.h b/kernel/kcsan/kcsan.h
> index ae33c2a7f07e..2a36813c3a76 100644
> --- a/kernel/kcsan/kcsan.h
> +++ b/kernel/kcsan/kcsan.h
> @@ -25,6 +25,16 @@ extern unsigned int kcsan_udelay_interrupt;
>   */
>  extern bool kcsan_enabled;
>
> +void kcsan_target_set(unsigned long addr);
> +unsigned long kcsan_target_get(void);
> +
> +static __always_inline bool
> +kcsan_target_matches(unsigned long target, unsigned long addr,
> +                    size_t size)
> +{
> +       return size && target >= addr && target - addr < size;
> +}
> +
>  /*
>   * Save/restore IRQ flags state trace dirtied by KCSAN.
>   */
> --
> 2.55.0
>
