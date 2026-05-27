Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC26466B55
	for <workflows@vger.kernel.org>; Wed, 27 May 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905437; cv=none; b=GwSsJBUFmzIsRSLRE7WQDlRLOwHFsUicC6w2LHi7QfjoMOHDtHkSrZVMu1rR/caucYrmW3LpdvCBVhgeTRYuErCaTqdTrSt0Trx2jD8pjDqeEuBrlBfUI18cwE1WX1Yt3mQOi4Mk1AMcISwLtb0NvshmUcebYvajdxYu/4cEdrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905437; c=relaxed/simple;
	bh=FB7zc86Z9JwA5tIlxQwL6TWLMDxSRypJjpULpguWMV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=nc21UE3xes482CtJ7VH3A5LV/5KOPrx4LspI4Q5pflu2tblSS75FN6klf/Q8VAs70/GGqkz/I4SzrKolGoEIEC0Zpa5++yEELAtpkBfuuNMnzakYEIbwRe3AU56DcCqx4JV/O7KQfGGjwfO+CkdmsGJKYBZgGsa7e5WLi6UUK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u12bpC54; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u12bpC54"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8354503d9acso13897338b3a.1
        for <workflows@vger.kernel.org>; Wed, 27 May 2026 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905435; x=1780510235; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmQrBP64QgwtPwQkL0LeP7Kj+/VUU6DHNyZ246jI55k=;
        b=u12bpC542gufWzl+OgFyAg8oJdzxKKIQTDEpm8OBLdLksS/mrMkC+uLaSC4pZuYPHn
         cyTFnPdCKA25q9cOjZwHS9UsJdNTpqcJwuaDshZuG2FTl8/UwTeNDRmHnokavTFYb9ZN
         ogWHwl8K1PLYYEpmbiSXUUt3NVg13ediDaKZYTxhvjgeBlMHoSRi1SCdjhZjr1+U9P4g
         o3KvxEvZYeuxcIQMvU0tbtMq/fHVqOjO3m1LIxtehLPWsII3h9HMDW4Wk+PinOc1QeU3
         wLG4HEohgJFcaPOVo2gYkjh6Mauef8rfqP/jACLMiYW0bDXV7rJ+9HBHOjS90VkDmlPx
         edXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905435; x=1780510235;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmQrBP64QgwtPwQkL0LeP7Kj+/VUU6DHNyZ246jI55k=;
        b=CSfel8sFDDXG0B8L8Egc93gvVpOGZt8RdA/nAg1pptDqmjZ+D+5uNobYoTlOgxyPJV
         8zZEUyX+HoT/+y20ZrrRiIrHKPmHMbUXcCoFRsxTj0z1YgXmEJIZR4G7fmcsNlpxy2K6
         AL5Zt2KAMytxjtSep9hgZVNFtnr+UmEY0IaRbQww5VT5sjFdUgLKCVJkus6PgINU6s18
         Cu6C5xqgH42l5ovHkZd1sCYKcGJyjwMaDHR/ypEyTKX2+OKOgbaTKbKnEKqc0hR6Xphg
         EKLdYXDAA0+G00RBBde5agY7O0tkZ939fzQ17rFnDCuLb+SEpZBO+YaCZ6TuZTJ3a8s4
         bVYA==
X-Forwarded-Encrypted: i=1; AFNElJ9AD1QI37s9NZBfnN1f4EfVcHaciagxyyWvhDk6RvF7l2zoet5iGeQOn8z7uwYCvmYUD13ZtGWT3RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYblmez/gUoGyWRPW9Q9elXtQ+j+4dxkg6zKWWHdUO+e8vIg1
	tlr5/quciivOnLGiCLCcls7+ulv3Ny/PUIZBPkKG9ZvF87yptqjOBs/1NzEogWc567TCvDdluOh
	krtIvpQ==
X-Received: from pfld13.prod.google.com ([2002:a05:6a00:198d:b0:83e:e011:246b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e04:b0:83f:250d:59c
 with SMTP id d2e1a72fcca58-8415f64b432mr25687913b3a.39.1779905435142; Wed, 27
 May 2026 11:10:35 -0700 (PDT)
Date: Wed, 27 May 2026 11:10:02 -0700
In-Reply-To: <20260518104154.38915-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260518104154.38915-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990531688.4122040.12101957747520595968.b4-ty@google.com>
Subject: Re: [PATCH] MAINTAINERS: KVM: Include maintainer profile
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 18 May 2026 12:41:55 +0200, Krzysztof Kozlowski wrote:
> No dedicated KVM maintainers are returned by get_maintainers.pl for the
> subsystem maintainer profile, thus patches changing that file miss
> the actual owners of the file.

Applied to kvm-x86 misc, thanks!

[1/1] MAINTAINERS: KVM: Include maintainer profile
      https://github.com/kvm-x86/linux/commit/66472e86703f

--
https://github.com/kvm-x86/linux/tree/next
