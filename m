Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35E1ACED7
	for <workflows@vger.kernel.org>; Tue, 25 Feb 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509311; cv=none; b=WVsQHbK4gvb0P9osx8lObbzI+qJZBMlFenLf9jtjlEhM/rgiS2cr+Y9XPkPX+GqA0IPK7Scm6atZak2Dm69H8M0Ax7INqM5qNHJDNxWHUwDDsiBanMwKdPnAe5RH2xlUZORm5sSNaZGiu5a96MW4QiH02PM4HBmjEaL3X8XmKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509311; c=relaxed/simple;
	bh=tCCjly+Qh5AY74QbK5LfS4mXEJXwkw/OWlEpJf5244k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0bNwWkmKTx9E6rvWiKKLRHu1T1sQC3Lrb9wvNpuMvCtTdpqKsU4JlHsNUyO4QoQ/9K5Ztjgz8uzTmYXEgnSTYCSvU2SSJYyYeG3E/Nt9q9eP5Y62/QsnitcMwhG/POz3TIji3r8oHF3rk1auCInAIJ8IHdAIa3119FdRlPbZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoH3j/SJ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoH3j/SJ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abad214f9c9so109410366b.0
        for <workflows@vger.kernel.org>; Tue, 25 Feb 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509308; x=1741114108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=IoH3j/SJJNMyiCNeXqg+0ck4j8VISqO5IN9kZ5nBdSnw9B3b4QcdgP5xP67i9rpDxX
         dmTS2sxtoRltGWqdZvOserGg7UJhrR3BixI/OXKBDKtSDThMkPp5Mze3LXLzGFV3g0tj
         pRHBYiCOKVK+GcpBi1OKpuL+ZuGa4xeBvln5nRp1fc4qz2YXfkMrT9SB4L7XWyoGujBn
         E3PYoLNkZoZr/RzT557MuOvqOthd1f1TCQkS0gihwQAnYtVIzvusr265UD/UOiC/c2CJ
         COQ9hrI/cMSEUg9jqyFs6q/yCivfqO6Gbmps9BmvaMKbdk0ilfCCcFVkhbbTxUCnYeQD
         g0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509308; x=1741114108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=gBUT3gbGn6XqsAMVpjo0BCialGe9XANGcp2/jJ8Z1B7KuVfoiuzsFfg8RKY1Ic1iQR
         D2HAv1ObJtcctCK4mkUH9nUHg3E6l3pSpKp9HrtQJkg4iakTblPsvztr4doGffQGJMJ8
         AZFUs2dZmUhBVWsB/xGqvx3xx7Btfuz3OVa67OwHCSnybCNsTYqgBv0gaFDlm4EPX/Ar
         kmPUsxWUG96reOJMYx7Tsxvljpey2A7yCvTIxUkQNSUDs3pLj4IlhHeMakiO9zEuEoRf
         t+kCkXyM7wPFi6tQxjK0fp0B7cwz19IPs1CbmHhoyHl85og06ffLF/yI5Md6xEb48tE5
         lIYw==
X-Forwarded-Encrypted: i=1; AJvYcCVjLAe1+pJe8M3UJlvffsTVmtHE3ID8zus1g/i1XMLYFJPftgnDrVXZEziIVY3tb9lctOuVc4vM7wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypiscJIuGKAMA8Jo97vfDybG5X3Fi2HFd1fqvBnZn0wZ0EMk0p
	IW8xJgFoCc68Nn6QHLXBWNAiyXkou38jEAZ0PqeWVvJ7y6b4q2fK4Ib2I6fEG0A=
X-Gm-Gg: ASbGnct0TSjt/Wzm2zVxoafY4d8oKQxIwi0eA051GPjWGczNojndgJRLooSnkBs0O9+
	SBZ0m/rNYDR3x91CCm52IXLp6iJdokTM4HF3SxAF+otPzXr2TcFfCZ/NjfrBzE4Rt1Hxv/hhOLG
	Hqc1710S0qCNLv32IwIaRY5/O7nrI4mLOkEIe7R+9sS1EVuQrDQi3IhXpL/fNUouN48mf1RSwIs
	fXC+8sZOwPJePNGdlz6x+9hwyc1ouPoxPIaIjIk/lqVOw9OFMRZTnhW85GGZkCrQ/0NhYAzbDjV
	3VXYfTsl5lm35a0cIASbGhR0d70JSt4sroAIDZp4LSAkeMf6RAqpTXUDI+CoXTFeX+PYrr7f/Qc
	=
X-Google-Smtp-Source: AGHT+IFKOZhRHtEHCCTN5BHVYVCPkFDsRkb7jCM4fs2ECH+kp2S3Jaa2qQ2qzrnOEoKDVZtT2N63uw==
X-Received: by 2002:a17:907:2d20:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abc09a14d0dmr792407366b.4.1740509307824;
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive
Date: Tue, 25 Feb 2025 19:48:22 +0100
Message-ID: <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree bindings patches go usually via driver subsystem tree, so
obviously testing only SoC branches would result in new dtbs_check
warnings.  Mention that linux-next branch is decisice for zero-warnings
rule.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
index 1b32430d0cfc..5423fb7d6047 100644
--- a/Documentation/process/maintainer-soc-clean-dts.rst
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
 No changes to the SoC platform Devicetree sources (DTS files) should introduce
 new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
 results of issues in an included DTSI file, are considered existing, not new
-warnings.  The platform maintainers have automation in place which should point
-out any new warnings.
+warnings.  For series split between different trees (DT bindings go via driver
+subsystem tree), warnings on linux-next are decisive.  The platform maintainers
+have automation in place which should point out any new warnings.
 
 If a commit introducing new warnings gets accepted somehow, the resulting
 issues shall be fixed in reasonable time (e.g. within one release) or the
-- 
2.43.0

